#ifndef DFSDK_H
#define DFSDK_H

#include "dfsdk_global.h"

/*
 *Summary: Start DF sensor query thread
 *Parameters:
 *     param[in]: thread parameters, see T_DfThreadParam.
 *     dfThread[out]: df inner thread id.
 *Return : E_DEC_Ok,E_DEC_ParameterInvalid,E_DEC_DeviceAddressExisted,E_DEC_UnsupportControlSystem.
 */
extern "C" DFSDKSHARED_EXPORT E_DfErrorCode df_startThread(const T_DfThreadParam* param, DfThread* dfThread);

/*
 *Summary: Stop DF sensor thread
 *Parameters:
 *     dfThread[in]: df inner thread id.
 *Return : E_DEC_Ok,E_DEC_DeviceAddressNotExist.
 */
extern "C" DFSDKSHARED_EXPORT E_DfErrorCode df_stopThread(DfThread dfThread);

/*
 *Summary: Stop all DF sensor thread
 *Parameters:
 *     none.
 *Return : E_DEC_Ok.
 */
extern "C" DFSDKSHARED_EXPORT E_DfErrorCode df_stopAllThread();

/*
 *Summary: Get SPI device path count for Ydea
 *Parameters:
 *     count[out]: device path count.
 *Return : E_DEC_Ok.
 */
extern "C" DFSDKSHARED_EXPORT E_DfErrorCode df_getYdeaAddressCount(uint* count);

/*
 *Summary: Get SPI device path
 *Parameters:
 *     index[in]: device path index.
 *     address[out]: output buffer, size should be 260.
 *Return : E_DEC_Ok,E_DEC_DeviceNotExist.
 */
extern "C" DFSDKSHARED_EXPORT E_DfErrorCode df_getYdeaAddress(uint index, char* address);


/*
 *Summary: Add display
 *Parameters:
 *     param[in]: display parameters, see T_DfDisplayCreateParam.
 *     displayIndex[out]: display index, 0~254, 0xFF is invalid.
 *Return : E_DEC_Ok,E_DEC_ParameterInvalid,E_DEC_DisplayCountOutOfLimit,E_DEC_UnsupportModule.
 */
extern "C" DFSDKSHARED_EXPORT E_DfErrorCode df_addDisplay(const T_DfDisplayCreateParam* param, uchar* displayIndex);

/*
 *Summary: Remove display
 *Parameters:
 *     displayIndex[in]: display index, 0~254, 0xFF: all display.
 *Return : E_DEC_Ok,E_DEC_DisplayNotExist.
 */
extern "C" DFSDKSHARED_EXPORT E_DfErrorCode df_removeDisplay(uchar displayIndex);

/*
 *Summary: Set display connection
 *Parameters:
 *     displayIndex[in]: display index, 0~254.
 *     portConnArray[in]: connection of sending card port. see T_DfPortConnection
 *     portCount[in]: portConnArray length.
 *Return : E_DEC_Ok,E_DEC_DisplayNotExist.
 */
extern "C" DFSDKSHARED_EXPORT E_DfErrorCode df_setDisplayConnection(uchar displayIndex, T_DfPortConnection* portConnArray, uchar portCount);

/*
 *Summary: Get display parameters
 *Parameters:
 *     displayIndex[in]: display index, 0~254.
 *     dcParam[out]: display create parameters.
 *     dispParam[out]: display parameters.
 *Return : E_DEC_Ok,E_DEC_DisplayNotExist.
 */
extern "C" DFSDKSHARED_EXPORT E_DfErrorCode df_getDisplayParam(uchar displayIndex, T_DfDisplayCreateParam* dcParam, T_DfDisplayParam* dispParam);


/*
 *Summary: Find receiver position by address. Only use for handle sensor raw data youself.
 *Parameters:
 *     addr[in]: receiving card address.
 *     pos[out]: receiving card position.
 *     dispParam[out]: display parameters.
 *Return : E_DEC_Ok,E_DEC_ReceiverNotExist,E_DEC_InnerError.
 */
extern "C" DFSDKSHARED_EXPORT E_DfErrorCode df_findReceiverPos(const T_DfReceiverAddr* addr, T_DfReceiverPos* pos, T_DfDisplayParam* dispParam);

/*
 *Summary: Clear sensor state.
 *Parameters:
 *     displayIndex[in]: display index, 0~254, 0xFF: all display.
 *Return : E_DEC_Ok,E_DEC_DisplayNotExist.
 */
extern "C" DFSDKSHARED_EXPORT E_DfErrorCode df_clearSensorState(uchar displayIndex);

/*
 *Summary: Decrease activeTick, for sensor test blink.
 *Parameters:
 *     none
 *Return : E_DEC_Ok.
 */
extern "C" DFSDKSHARED_EXPORT E_DfErrorCode df_decActiveTick();

/*
 *Summary: Get display sensor data handle.
 *Parameters:
 *     displayIndex[in]: display index, 0~254.
 *     handle[out]: sensor data handle.
 *     dispParam[out]: display parameters.
 *Return : E_DEC_Ok,E_DEC_DisplayNotExist,E_DEC_ParameterInvalid.
 */
extern "C" DFSDKSHARED_EXPORT E_DfErrorCode df_beginScene(uchar displayIndex, DfHandle* handle, T_DfDisplayParam* dispParam);

/*
 *Summary: Get sensor data of specified sensor.
 *Parameters:
 *     handle[in]: sensor data handle.
 *     sensorRow[in]: sensor row.
 *     sensorCol[in]: sensor column.
 *     sensorInfo[out]: sensor data.
 *     group[out]: sensor group. see T_DfGroup.
 *Return : E_DEC_Ok,E_DEC_DisplayNotExist,E_DEC_ParameterInvalid.
 */
extern "C" DFSDKSHARED_EXPORT E_DfErrorCode df_getSensorInfo(DfHandle handle, ushort sensorRow, ushort sensorCol, T_DfSensorInfo* sensorInfo, T_DfGroup* group);

/*
 *Summary: Close display sensor data handle.
 *Parameters:
 *     handle[in]: sensor data handle.
 *Return : E_DEC_Ok.
 */
extern "C" DFSDKSHARED_EXPORT E_DfErrorCode df_endScene(DfHandle handle);


#endif // DFSDK_H
