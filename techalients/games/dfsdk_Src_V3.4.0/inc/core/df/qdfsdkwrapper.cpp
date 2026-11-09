#include "qdfsdkwrapper.h"
#include <QtCore>

#ifdef QT_DEBUG
#pragma comment(lib, "dfsdk_d.lib")
#else
#pragma comment(lib, "dfsdk.lib")
#endif


static void dumpSensorState(T_DfReceiverSensorState* info)
{
    qDebug() << "addr:" << info->addr.senderIndex << info->addr.mainPort << info->addr.recvAddr;
    //qDebug() << "value:" << info->infi.value;

    qDebug() << "row1:"<< info->r11 << info->r12 << info->r13 << info->r14;
    qDebug() << "row2:"<< info->r21 << info->r22 << info->r23 << info->r24;
    qDebug() << "row3:"<< info->r31 << info->r32 << info->r33 << info->r34;
    qDebug() << "row4:"<< info->r41 << info->r42 << info->r43 << info->r44;
}

static void onStateChanged(void* data, uchar senderIndex, bool connected)
{
    QDfSdkWrapper* dfmgr = (QDfSdkWrapper*)data;
    emit dfmgr->stateChanged(senderIndex, connected);
}

static void onReadRawData(void* data, uchar senderIndex, T_DfReceiverSensorState* sensorData, int count)
{
    Q_UNUSED(data);
    Q_UNUSED(senderIndex);
    if(count > 0) dumpSensorState(sensorData);
}

static void onPointActive(void* data, uchar displayIndex, T_DfPoint* points, int count)
{
#ifdef QT_DEBUG
    qDebug() << __FUNCTION__ << displayIndex << count;
#endif
    QList<T_DfPoint> lsPoints(std::initializer_list<T_DfPoint>(points,points+count));

    QDfSdkWrapper* dfmgr = (QDfSdkWrapper*)data;
    emit dfmgr->pointActive(displayIndex, lsPoints);

}

static void onPointDeactive(void* data, uchar displayIndex, T_DfPoint* points, int count)
{
#ifdef QT_DEBUG
    qDebug() << __FUNCTION__ << displayIndex << count;
#endif
    QList<T_DfPoint> lsPoints(std::initializer_list<T_DfPoint>(points,points+count));
    QDfSdkWrapper* dfmgr = (QDfSdkWrapper*)data;
    emit dfmgr->pointDeactive(displayIndex, lsPoints);
}

static void onTraceLog(void* data, uchar senderIndex, const char* utf8Log)
{
    Q_UNUSED(data);
    Q_UNUSED(senderIndex);
    QDfSdkWrapper* dfmgr = (QDfSdkWrapper*)data;
    emit dfmgr->traceLog(QByteArray(utf8Log));
}


//
// QDfSdkWrapper
//
QDfSdkWrapper::QDfSdkWrapper(QObject *parent)
    : QObject(parent)
{
    qRegisterMetaType<QList<T_DfPoint>>();
}

QDfSdkWrapper::~QDfSdkWrapper()
{
    stopAllThread();
}

uchar QDfSdkWrapper::addDisplay(E_DfModule module, uchar rowCount, uchar colCount)
{
    uchar displayIndex = 0xFF;
    T_DfDisplayCreateParam dcParam;
    memset(&dcParam, 0, sizeof(dcParam));
    dcParam.module  = module;
    dcParam.colCount = colCount;
    dcParam.rowCount = rowCount;
    dcParam.activeTickInitCount = 10;
    dcParam.pointActiveMode = E_DPAM_Increase;
    dcParam.callbackData = this;
    dcParam.onPointActive = onPointActive;
    dcParam.onPointDeactive = onPointDeactive;

    ::df_addDisplay(&dcParam, &displayIndex);
    return displayIndex;
}

bool QDfSdkWrapper::removeDisplay(uchar displayIndex)
{
    return DF_SUCCEED(::df_removeDisplay(displayIndex));
}

bool QDfSdkWrapper::removeAllDisplays()
{
    return DF_SUCCEED(::df_removeDisplay(DF_ALL_DISPALAY));
}

bool QDfSdkWrapper::getDisplayParam(uchar displayIndex, T_DfDisplayCreateParam* dcParam, T_DfDisplayParam* dispParam)
{
    return DF_SUCCEED(::df_getDisplayParam(displayIndex, dcParam, dispParam));
}

bool QDfSdkWrapper::setDisplayConnection(uchar displayIndex, T_DfPortConnection* portConnArray, uchar portCount)
{
    return DF_SUCCEED(::df_setDisplayConnection(displayIndex, portConnArray, portCount));
}

void QDfSdkWrapper::decActiveTick() const
{
    ::df_decActiveTick();
}

bool QDfSdkWrapper::clearSensorState(uchar displayIndex) const
{
    return DF_SUCCEED(::df_clearSensorState(displayIndex));
}

bool QDfSdkWrapper::beginScene(uchar displayIndex, DfHandle* handle, T_DfDisplayParam* dispParam) const
{
    return DF_SUCCEED(::df_beginScene(displayIndex, handle, dispParam));
}

bool QDfSdkWrapper::getSensorInfo(DfHandle handle, ushort sensorRow, ushort sensorCol, T_DfSensorInfo* sensorInfo, T_DfGroup* group) const
{
    return DF_SUCCEED(::df_getSensorInfo(handle, sensorRow, sensorCol, sensorInfo, group));
}

bool QDfSdkWrapper::endScene(DfHandle handle) const
{
    return DF_SUCCEED(::df_endScene(handle));
}

DfThread QDfSdkWrapper::startReadNova(const QByteArray& ipAddr, uchar senderIndex)
{
    DfThread dfThread;
    T_DfThreadParam param;
    memset(&param, 0, sizeof(param));

    sprintf(param.address, "%s:%d", ipAddr.data(), 6000);
    param.ctrlSys = E_DCS_Nova;
    param.refreshMsec = 20;
    param.senderIndex = senderIndex;
    param.callbackData = this;
#ifdef QT_DEBUG
    param.onReadRawData = onReadRawData;
#endif
    param.onStateChanged = onStateChanged;
    param.onTraceLog = onTraceLog;

    df_startThread(&param, &dfThread);
    return dfThread;
}

DfThread QDfSdkWrapper::startReadYdea(const QByteArray& ydeaAddr, uchar senderIndex)
{
    DfThread dfThread;
    T_DfThreadParam param;
    memset(&param, 0, sizeof(param));

    sprintf(param.address,"%s", ydeaAddr.data());
    param.ctrlSys = E_DCS_Ydea;
    param.refreshMsec = 50;
    param.senderIndex = senderIndex;
    param.callbackData = this;
#ifdef QT_DEBUG
    param.onReadRawData = onReadRawData;
#endif
    param.onStateChanged = onStateChanged;
    param.onTraceLog = onTraceLog;

    df_startThread(&param, &dfThread);
    return dfThread;
}

bool QDfSdkWrapper::stopThread(DfThread dfThread)
{
    return DF_SUCCEED(::df_stopThread(dfThread));
}

void QDfSdkWrapper::stopAllThread()
{
    ::df_stopAllThread();
}

QList<QByteArray> QDfSdkWrapper::getYdeaAddresses()
{
    QList<QByteArray> list;
    uint count = 0;
    ::df_getYdeaAddressCount(&count);
    for(uint index = 0; index < count; index++)
    {
        QByteArray addr(260, '\0');
        ::df_getYdeaAddress(index, addr.data());
        list.append(addr.trimmed());
    }

    return list;
}


