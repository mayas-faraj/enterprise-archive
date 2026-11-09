#ifndef DFSDK_GLOBAL_H
#define DFSDK_GLOBAL_H


#if defined(DFSDK_LIBRARY)
#  define DFSDKSHARED_EXPORT _declspec(dllexport)
#else
#  define DFSDKSHARED_EXPORT _declspec(dllimport)
#endif

#define  DF_UNUSED(x) (void)x

enum E_DfControlSystem
{
    E_DCS_Unknown,
    E_DCS_Nova,
    E_DCS_Ydea,
};

enum E_DfModule
{
    E_DM_Unknown,
    E_DM_5_95,    // DF 5.85
    E_DM_7_8,     // DF 7.8
};

enum E_DfErrorCode
{
    E_DEC_Ok                     = 0x00000000,
    E_DEC_ParameterInvalid       = 0x00000001,
    E_DEC_DeviceAddressExisted   = 0x00000002,
    E_DEC_DeviceAddressNotExist  = 0x00000003,
    E_DEC_UnsupportControlSystem = 0x00000004,
    E_DEC_UnsupportModule        = 0x00000005,
    E_DEC_DisplayCountOutOfLimit = 0x00000006,
    E_DEC_ReceiverNotExist       = 0x00000007,
    E_DEC_InnerError             = 0x00000008,
    E_DEC_DisplayNotExist        = 0x00000009,
    E_DEC_DeviceNotExist         = 0x0000000A,
};


/*
 * E_DfPointActiveMode:
 *
 * DF SDK handle sensor's active state information, it consider active sensors connected side by side as a group,
 * trigger only one point active event, and coordinate of the point is center of gravity of those active sensors.
 * For example:
 *  *****************************************************************
 *  - + - - + + - -
 *  + + - - + - - -
 *  - - + - - - - -
 *  - - - - - - - -
 *
 *  There are 32 sensors, '+' as active, '-' as deactive.
 *  *****************************************************************
 *
 *  SDK will grouping as follow:
 *  *****************************************************************
 *  - 1 - - 2 2 - -
 *  1 1 - - 2 - - -
 *  - - 1 - - - - -
 *  - - - - - - - -
 *
 *  Trigger 2 point active event not 7.
 *  *****************************************************************
 *
 * When active sensors of group decrease but more than 0, no event trigger;
 * decrease to 0 trigger the point deactive event.
 *  For example:
 *  *****************************************************************
 *  - 1 - - 2 2 - -              - 1 - - - - - -
 *  1 1 - - 2 - - -    ---->     1 1 - - - - - -
 *  - - 1 - - - - -              - - - - - - - -
 *  - - - - - - - -              - - - - - - - -
 *
 *  Group 1 no event trigger, Group 2 trigger point deactive event.
 *  *****************************************************************
 *
 *
 * When active sensors of group increase, different E_DfPointActiveMode different .
 *  For example:
 *  *****************************************************************
 *  - 1 - - - - - -              - 1 - - - - - -
 *  1 1 - - - - - -    ---->     1 1 - - - - - -
 *  - - 1 - - - - -              1 1 1 - - - - -
 *  - - - - - - - -              - - - - - - - -
 *
 *  E_DPAM_Increase: trigger point active event.
 *  E_DPAM_FullNew : no event trigger.
 *  *****************************************************************
 *
 */
enum E_DfPointActiveMode
{
    E_DPAM_Increase = 0x00,
    E_DPAM_FullNew  = 0x01,
};

typedef void*        DfHandle;
typedef unsigned int DfThread;

#ifndef uchar
#define uchar unsigned char
#endif

#ifndef ushort
#define ushort unsigned short
#endif

#ifndef uint
#define uint unsigned int
#endif

#define DF_SUCCEED(x) (x)==E_DEC_Ok
#define DF_FAILED(x)  (x)!=E_DEC_Ok

#define DF_MAX_GROUP     65534
#define DF_ALL_DISPALAY  0xFF

#pragma pack(push,1)

union T_DfReceiverAddr
{
    struct
    {
        uchar  senderIndex; // sending card index
        uchar  mainPort;    // sending card port
        ushort recvAddr;    // receiving card index
    };
    uint addrId;
};

struct T_DfReceiverPos
{
    uchar displayIndex;
    uchar reserved;
    uchar row;
    uchar col;
};

struct T_DfPosition
{
    uchar row;
    uchar col;
};

struct T_DfPortConnection
{
    uchar senderIndex;       // sending card index
    uchar mainPort;          // sending card port
    uchar receiverCount;     // receiver card count
    uchar reserved;          // unused
    T_DfPosition pos[256];   // receiver card row & col position
};

struct T_DfPoint
{
    int    x;
    int    y;
    ushort sensorCount;
    ushort group;
};

// A collection of sensors
struct T_DfGroup
{
    int    avgX;                // average of x, in pixel
    int    avgY;                // average of y, in pixel
    uint   newActive:1;         // active in last query
    uint   sensorCount:31;      // number of sensors in group
};


struct T_DfReceiverSensorState
{
    T_DfReceiverAddr addr;

    ushort reserved;
    union
    {
        ushort value;
        struct
        {
            ushort r33:1; // sensor value: 0 say activate/hit, 1 say normal.
            ushort r43:1;
            ushort r34:1;
            ushort r44:1;

            ushort r13:1;
            ushort r23:1;
            ushort r14:1;
            ushort r24:1;

            ushort r11:1;
            ushort r21:1;
            ushort r12:1;
            ushort r22:1;

            ushort r31:1;
            ushort r41:1;
            ushort r32:1;
            ushort r42:1;
        };
        struct
        {
            uchar byte1;
            uchar byte2;
        };
    };
};


struct T_DfSensorInfo
{
    ushort isActive:1;          //是否处于激活状态
    ushort hadActive:1;         //是否曾经激活
    ushort changed:1;           //state changed in current refresh action
    ushort activeTick:5;        //when sensor active init with T_DfDisplayCreateParam.activeTickInitCount, use for sensor test
    ushort reserved:8;          //sdk inner use
    ushort group;               //group id
};


typedef void (*df_func_stateChanged) (void* data, uchar senderIndex, bool connected);
typedef void (*df_func_readRawData)  (void* data, uchar senderIndex, T_DfReceiverSensorState* sensorData, int count);
typedef void (*df_func_traceLog)     (void* data, uchar senderIndex, const char* utf8Log);
typedef void (*df_func_pointActive)  (void* data, uchar displayIndex, T_DfPoint* points, int count);

struct T_DfThreadParam
{
    E_DfControlSystem    ctrlSys;           // Nova or Ydea
    char                 address[256];      // Nova: IP address; Ydea: SPI device path
    uchar                senderIndex;
    uchar                refreshMsec;       // 20~256 millisecond
    uchar                reserved[2];
    void*                callbackData;      // callback function data
    df_func_stateChanged onStateChanged;    // connect state changed
    df_func_readRawData  onReadRawData;     // for handle raw data
    df_func_traceLog     onTraceLog;        // for debug
};


// Display create parameters
struct T_DfDisplayCreateParam
{
    E_DfModule           module;              // DF 7.8 or DF 5.95
    uchar                rowCount;            // receiving card row count
    uchar                colCount;            // receiving card column count
    uchar                activeTickInitCount; // init value for T_DfSensorInfo::activeTick, use in df_decActiveTick, for sensor test. max: 32
    uchar                pointActiveMode;     // see E_DfPointActiveMode

    void*                callbackData;
    df_func_pointActive  onPointActive;
    df_func_pointActive  onPointDeactive;
};

// Display parameters, read only
struct T_DfDisplayParam
{
    uchar                moduleRowCountPerReceiver;
    uchar                moduleColCountPerReceiver;
    uchar                sensorRowCountPerModule;
    uchar                sensorColCountPerModule;

    uchar                moduleWidth;          //in pixel
    uchar                moduleHeight;         //in pixel

    //---------------------------------------
    uchar                sensorWidth;          //in pixel
    uchar                sensorHeight;         //in pixel

    ushort               displayWidth;         //in pixel
    ushort               displayHeight;        //in pixel

    ushort               sensorRowCount;
    ushort               sensorColCount;

    uchar                sensorRowCountPerReceiver;
    uchar                sensorColCountPerReceiver;
    uchar                rowCount;
    uchar                colCount;
};

#pragma pack(pop)


#endif // DFSDK_GLOBAL_H
