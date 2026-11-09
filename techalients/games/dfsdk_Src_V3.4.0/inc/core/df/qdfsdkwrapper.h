#ifndef QDFSDKWRAPPER_H
#define QDFSDKWRAPPER_H

#include <QtCore>
#include <sdk/df/dfsdk.h>

Q_DECLARE_METATYPE(T_DfPoint)

//
// QDfSdkWrapper
//
class QDfSdkWrapper : public QObject
{
    Q_OBJECT
public:
    explicit QDfSdkWrapper(QObject *parent = 0);
    ~QDfSdkWrapper();

    uchar addDisplay(E_DfModule module, uchar rowCount, uchar colCount);
    bool removeDisplay(uchar displayIndex);
    bool removeAllDisplays();
    bool getDisplayParam(uchar displayIndex, T_DfDisplayCreateParam* dcParam, T_DfDisplayParam* dispParam);
    bool setDisplayConnection(uchar displayIndex, T_DfPortConnection* portConnArray, uchar portCount);
    void decActiveTick() const;
    bool clearSensorState(uchar displayIndex) const;

    bool beginScene(uchar displayIndex, DfHandle* handle, T_DfDisplayParam* dispParam) const;
    bool getSensorInfo(DfHandle handle, ushort sensorRow, ushort sensorCol, T_DfSensorInfo* sensorInfo, T_DfGroup* group) const;
    bool endScene(DfHandle handle) const;

    DfThread startReadNova(const QByteArray& ipAddr, uchar senderIndex);
    DfThread startReadYdea(const QByteArray& ydeaAddr, uchar senderIndex);
    bool stopThread(DfThread dfThread);
    void stopAllThread();

public:
    static QList<QByteArray> getYdeaAddresses();
signals:
    void traceLog(QByteArray utf8Log);
    void stateChanged(uchar senderIndex, bool connected);
    void pointActive(uchar displayIndex, QList<T_DfPoint> points);
    void pointDeactive(uchar displayIndex, QList<T_DfPoint> points);
};

#endif // QDFSDKWRAPPER_H
