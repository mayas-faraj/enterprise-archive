Attribute VB_Name = "EZTwain"

Declare Function TWAIN_AcquireNative Lib "EZTW32.DLL" (ByVal hwndApp As Long, ByVal wPixTypes As Long) As Long
 ' The minimal use of EZTWAIN.DLL is to just call this routine, with 0 for
 ' both params. EZTWAIN creates a window if hwndApp is 0.
 '
 ' Acquires a single image, from the currently selected Data Source, using
 ' Native-mode transfer. It waits until the source closes (if it's modal) or
 ' forces the source closed if not. The return value is a handle to the
 ' acquired image. Only one image can be acquired per call.
 '
 ' Under Windows, the return value is a global memory handle - applying
 ' GlobalLock to it will return a (huge) pointer to the DIB, which
 ' starts with a BITMAPINFOHEADER.
 ' NOTE: You are responsible for disposing of the returned DIB - these things
 ' can eat up your Windows memory fast! See TWAIN_FreeNative below.
 '
 ' The image type can be restricted using the following masks. A mask of 0
 ' means 'any pixel type is welcome'.
 ' Caution: You should not assume that the source will honor a pixel type
 ' restriction! If you care, check the parameters of the DIB.

Global Const TWAIN_BW = &H1  ' 1-bit per pixel, B&W (== TWPT_BW)
Global Const TWAIN_GRAY = &H2  ' 1,4, or 8-bit grayscale (== TWPT_GRAY)
Global Const TWAIN_RGB = &H4  ' 24-bit RGB color (== TWPT_RGB)
Global Const TWAIN_PALETTE = &H8  ' 1,4, or 8-bit palette (== TWPT_PALETTE)
Global Const TWAIN_ANYTYPE = &H0  ' any of the above

Declare Sub TWAIN_FreeNative Lib "EZTW32.DLL" (ByVal hDib As Long)
 ' Release the memory allocated to a native format image, as returned by
 ' TWAIN_AcquireNative. (If you are coding in C or C++, this is just a call
 ' to GlobalFree.)
 ' If you use TWAIN_AcquireNative and don't free the returned image handle,
 ' it stays around taking up Windows (virtual) memory until your application
 ' terminates. Memory required per square inch:
 ' 1 bit B&W 8-bit grayscale 24-bit color
 ' 100 dpi 1.25KB 10KB 30KB
 ' 200 dpi 5KB 40KB 120KB
 ' 300 dpi 11.25KB 90KB 270KB
 ' 400 dpi 20KB 160KB 480KB
 '

Declare Function TWAIN_AcquireToClipboard Lib "EZTW32.DLL" (ByVal hwndApp As Long, ByVal wPixTypes As Long) As Long
 ' Like AcquireNative, but puts the resulting image, if any, into the system
 ' clipboard. Under Windows, this will put a CF_DIB item in the clipboard
 ' if successful. If this call fails, the clipboard is either empty or
 ' contains the old contents.
 ' A return value of 1 indicates success, 0 indicates failure.
 '
 ' Useful for environments like Visual Basic where it is hard to make direct
 ' use of a DIB handle. In fact, TWAIN_AcquireToClipboard uses
 ' TWAIN_AcquireNative for all the hard work.

Declare Function TWAIN_AcquireToFilename Lib "EZTW32.DLL" (ByVal hwndApp As Long, ByVal sFile As String) As Long
 ' Acquire an image and write it to a .BMP (Windows Bitmap) file.
 ' The file name and path in pszFile are used. If pszFile is NULL or
 ' points to an empty string, the user is prompted with a Save File dialog.
 ' Return values:
 ' -1 means the Acquire failed.
 ' 0 means the Save failed (or was cancelled)
 ' 1 indicates success.

Declare Function TWAIN_SelectImageSource Lib "EZTW32.DLL" (ByVal hwnd As Long) As Long
 ' This is the routine to call when the user chooses the "Select Source..."
 ' menu command from your application's File menu. Your app has one of
 ' these, right? The TWAIN spec calls for this feature to be available in
 ' your user interface, preferably as described.
 ' Note: If only one TWAIN device is installed on a system, it is selected
 ' automatically, so there is no need for the user to do Select Source.
 ' You should not require your users to do Select Source before Acquire.
 '
 ' This function posts the Source Manager's Select Source dialog box.
 ' It returns after the user either OK's or CANCEL's that dialog.
 ' A return of 1 indicates OK, 0 indicates one of the following:
 ' a) The user cancelled the dialog
 ' b) The Source Manager found no data sources installed
 ' c) There was a failure before the Select Source dialog could be posted
 ' -- details --
 ' Only sources that can return images (that are in the DG_IMAGE group) are
 ' displayed. The current default source will be highlighted initially.
 ' In the standard implementation of "Select Source...", your application
 ' doesn't need to do anything except make this one call.
 '
 ' If you want to be meticulous, disable your "Acquire" and "Select Source"
 ' menu items or buttons if TWAIN_IsAvailable () returns 0 - see below.


 ' --------- Basic TWAIN Inquiries

Declare Function TWAIN_IsAvailable Lib "EZTW32.DLL" () As Long
 ' Call this function any time to find out if TWAIN is installed on the
 ' system. It takes a little time on the first call, after that it's fast,
 ' just testing a flag. It returns 1 if the TWAIN Source Manager is
 ' installed & can be loaded, 0 otherwise.


Declare Function TWAIN_EasyVersion Lib "EZTW32.DLL" () As Long
 ' Returns the version number of EZTWAIN.DLL, multiplied by 100.
 ' So e.g. version 2.01 will return 201 from this call.

Declare Function TWAIN_State Lib "EZTW32.DLL" () As Long
 ' Returns the TWAIN Protocol State per the spec.
Global Const TWAIN_PRESESSION = 1 ' source manager not loaded
Global Const TWAIN_SM_LOADED = 2 ' source manager loaded
Global Const TWAIN_SM_OPEN = 3 ' source manager open
Global Const TWAIN_SOURCE_OPEN = 4 ' source open but not enabled
Global Const TWAIN_SOURCE_ENABLED = 5 ' source enabled to acquire
Global Const TWAIN_TRANSFER_READY = 6 ' image ready to transfer
Global Const TWAIN_TRANSFERRING = 7 ' image in transit

 ' --------- DIB handling utilities ---------

Declare Function TWAIN_DibDepth Lib "EZTW32.DLL" (ByVal hDib As Long) As Long
 ' Depth of DIB, in bits i.e. bits per pixel.
Declare Function TWAIN_DibWidth Lib "EZTW32.DLL" (ByVal hDib As Long) As Long
 ' Width of DIB, in pixels (columns)
Declare Function TWAIN_DibHeight Lib "EZTW32.DLL" (ByVal hDib As Long) As Long
 ' Height of DIB, in lines (rows)
Declare Function TWAIN_DibNumColors Lib "EZTW32.DLL" (ByVal hDib As Long) As Long
 ' Number of colors in color table of DIB

Declare Function TWAIN_RowSize Lib "EZTW32.DLL" (ByVal hDib As Long) As Long

Declare Sub TWAIN_ReadRow Lib "EZTW32.DLL" (ByVal hDib As Long, ByVal nRow As Long, prow As Any)
 ' Read row n of the given DIB into buffer at prow.
 ' Caller is responsible for ensuring buffer is large enough.
 ' Row 0 is the *top* row of the image, as it would be displayed.

Declare Function TWAIN_CreateDibPalette Lib "EZTW32.DLL" (ByVal hDib As Long) As Long ' Create and return a logical palette to be used for drawing the DIB.
 ' For 1, 4, and 8-bit DIBs the palette contains the DIB color table.
 ' For 24-bit DIBs, a default halftone palette is returned.

Declare Sub TWAIN_DrawDibToDC Lib "EZTW32.DLL" (ByVal hDC As Long, ByVal nDestX As Long, ByVal nDestX As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hDib As Long, ByVal nSrcX As Long, ByVal nSrcX As Long)
 ' byval hDC as long, ' destination device context
 ' byval nDestX as long, byval nDestX as long, ' destination (x,y)
 ' byval nWidth as long, byval nHeight as long, ' width and height
 ' byval hDib as long, ' DIB handle
 ' byval nSrcX as long, byval nSrcX as long ' source (x,y) in DIB
 ' Draws a DIB on a device context.
 ' You should call CreateDibPalette, select that palette
 ' into the DC, and do a RealizePalette (hDC) first.

 ' --------- BMP file utilities
 
Declare Function TWAIN_WriteNativeToFilename Lib "EZTW32.DLL" (ByVal hDib As Long, ByVal sFile As String) As Long
 ' Writes a DIB handle to a .BMP file
 '
 ' hdib = DIB handle, as returned by TWAIN_AcquireNative
 ' pszFile = far pointer to NUL-terminated filename
 ' If pszFile is NULL or points to a null string, prompts the user
 ' for the filename with a standard file-save dialog.
 '
 ' Return values:
 ' 0 success
 ' -1 user cancelled File Save dialog
 ' -2 file open error (invalid path or name, or access denied)
 ' -3 (weird) unable to lock DIB - probably an invalid handle.
 ' -4 writing BMP data failed, possibly output device is full

Declare Function TWAIN_WriteNativeToFile Lib "EZTW32.DLL" (ByVal hDib As Long, ByVal hFile As Long) As Long
 ' Writes a DIB to a file in .BMP format.
 '
 ' hdib = DIB handle, as returned by TWAIN_AcquireNative
 ' fh = file handle, as returned by _open, _lopen or OpenFile
 '
 ' Return value as for TWAIN_WriteNativeToFilename

Declare Function TWAIN_LoadNativeFromFilename Lib "EZTW32.DLL" (ByVal sFile As String) As Long
 ' Load a .BMP file and return a DIB handle (as from AcquireNative.)
 ' Accepts a filename (including path & extension).
 ' If pszFile is NULL or points to a null string, the user is prompted.
 ' Returns a DIB handle if successful, otherwise NULL.

Declare Function TWAIN_LoadNativeFromFile Lib "EZTW32.DLL" (ByVal hFile As Long) As Long
 ' Like LoadNativeFromFilename, but takes an already open file handle.


Declare Sub TWAIN_SetHideUI Lib "EZTW32.DLL" (ByVal nHide As Long)
Declare Function TWAIN_GetHideUI Lib "EZTW32.DLL" () As Long
 ' These functions control the 'hide source user interface' flag.
 ' This flag is cleared initially, but if you set it non-zero, then when
 ' a source is enabled it will be asked to hide its user interface.
 ' Note that this is only a request - some sources will ignore it!
 ' This affects AcquireNative, AcquireToClipboard, and EnableSource.
 ' If the user interface is hidden, you will probably want to set at least
 ' some of the basic acquisition parameters yourself - see
 ' SetCurrentUnits, SetBitDepth, SetCurrentPixelType and
 ' SetCurrentResolution below.

 ' --------- Application Registration

Declare Sub TWAIN_RegisterApp Lib "EZTW32.DLL" (ByVal nMajorNum As Long, ByVal nMinorNum As Long, ByVal nLanguage As Long, ByVal nCountry As Long, ByVal sVersion As String, ByVal sMfg As String, ByVal sFamily As String, ByVal sProduct As String)
 ' record application information
 ' byval nMajorNum as long, byval nMinorNum as long, ' major and incremental revision of application. E.g.
 ' ' for version 2.1, nMajorNum == 2 and nMinorNum == 1
 ' byval nLanguage as long, ' language of this version (use TWLG_xxx from TWAIN.H)
 ' byval nCountry as long, ' country of this version (use TWCY_xxx from TWAIN.H)
 ' byval sVersion as string, ' version info string e.g. "1.0b3 Beta release"
 ' byval sMfg as string, ' name of manufacturer/developer e.g. "Crazbat Software"
 ' byval sFamily as string, ' product family e.g. "BitStomper"
 ' byval sProduct as string) ' specific product e.g. "BitStomper Deluxe Pro"
 '
 ' TWAIN_RegisterApp can be called *AS THE FIRST CALL*, to register the
 ' application. If this function is not called, the application is given a
 ' 'generic' registration by EZTWAIN.
 ' Registration only provides this information to the Source Manager and any
 ' sources you may open - it is used for debugging, and (frankly) by some
 ' sources to give special treatment to certain applications.

 ' --------- Error Analysis and Reporting ------------------------------------

Declare Function TWAIN_GetResultCode Lib "EZTW32.DLL" ()  ' Return the result code (TWRC_xxx) from the last triplet sent to TWAIN

Declare Function TWAIN_GetConditionCode Lib "EZTW32.DLL" ()  ' Return the condition code from the last triplet sent to TWAIN.
 ' (To be precise, from the last call to TWAIN_DS below)
 ' If a source is NOT open, return the condition code of the source manager.

Declare Sub TWAIN_ErrorBox Lib "EZTW32.DLL" (ByVal sMsg As String)
 ' Post an error message dialog with an exclamation mark, OK button,
 ' and the title 'TWAIN Error'.
 ' pszMsg points to a null-terminated message string.

Declare Sub TWAIN_ReportLastError Lib "EZTW32.DLL" (ByVal sMsg As String)
 ' Like TWAIN_ErrorBox, but if some details are available from
 ' TWAIN about the last failure, they are included in the message box.


 ' --------- TWAIN State Control ------------------------------------

Declare Function TWAIN_LoadSourceManager Lib "EZTW32.DLL" () As Long
 ' Finds and loads the Data Source Manager, TWAIN.DLL.
 ' If Source Manager is already loaded, does nothing and returns TRUE.
 ' This can fail if TWAIN.DLL is not installed (in the right place), or
 ' if the library cannot load for some reason (insufficient memory?) or
 ' if TWAIN.DLL has been corrupted.

Declare Function TWAIN_OpenSourceManager Lib "EZTW32.DLL" (ByVal hwnd As Long) As Long
 ' Opens the Data Source Manager, if not already open.
 ' If the Source Manager is already open, does nothing and returns TRUE.
 ' This call will fail if the Source Manager is not loaded.

Declare Function TWAIN_OpenDefaultSource Lib "EZTW32.DLL" () As Long
 ' This opens the source selected in the Select Source dialog.
 ' If a source is already open, does nothing and returns TRUE.
 ' Fails if the source manager is not loaded and open.

Declare Function TWAIN_EnableSource Lib "EZTW32.DLL" (ByVal hwnd As Long) As Long
 ' Enables the open Data Source. This posts the source's user interface
 ' and allows image acquisition to begin. If the source is already enabled,
 ' this call does nothing and returns TRUE.

Declare Function TWAIN_DisableSource Lib "EZTW32.DLL" () As Long
 ' Disables the open Data Source, if any.
 ' This closes the source's user interface.
 ' If there is not an enabled source, does nothing and returns TRUE.

Declare Function TWAIN_CloseSource Lib "EZTW32.DLL" () As Long
 ' Closes the open Data Source, if any.
 ' If the source is enabled, disables it first.
 ' If there is not an open source, does nothing and returns TRUE.

Declare Function TWAIN_CloseSourceManager Lib "EZTW32.DLL" (ByVal hwnd As Long) As Long
 ' Closes the Data Source Manager, if it is open.
 ' If a source is open, disables and closes it as needed.
 ' If the Source Manager is not open, does nothing and returns TRUE.

Declare Function TWAIN_UnloadSourceManager Lib "EZTW32.DLL" () As Long
 ' Unloads the Data Source Manager i.e. TWAIN.DLL - releasing
 ' any associated memory or resources.
 ' This call will fail if the Source Manager is open, otherwise
 ' it always succeeds and returns TRUE.


Declare Function TWAIN_MessageHook Lib "EZTW32.DLL" (lpMsg As Any) As Long
 ' This function detects Windows messages that should be routed
 ' to an enabled Data Source, and picks them off. In a full TWAIN
 ' app, TWAIN_MessageHook is called inside the main GetMessage loop.
 
Declare Function TWAIN_WaitForNativeXfer Lib "EZTW32.DLL" (ByVal hwnd As Long) As Long

Declare Sub TWAIN_ModalEventLoop Lib "EZTW32.DLL" ()
 ' Process messages until termination, source disable, or image transfer.

Declare Function TWAIN_EndXfer Lib "EZTW32.DLL" () As Long

Declare Function TWAIN_AbortAllPendingXfers Lib "EZTW32.DLL" () As Long

Declare Function TWAIN_WriteDibToFile Lib "EZTW32.DLL" (ByVal lpDib As Long, ByVal hFile As Long) As Long
 ' Writes a DIB to a file in .BMP format.
 ' Returns TRUE if successful, FALSE otherwise.
 ' (Likely causes of failure: device full, or permission denied to write to file or device
 ' lpDIB = pointer to DIB, as from GlobalLock of DIB handle
 ' fh = file handle, as returned by C _open or Windows _lopen or OpenFile
 ' For example of use, see TWAIN_WriteNativeToFilename in EZTWAIN.C

Declare Function TWAIN_NegotiateXferCount Lib "EZTW32.DLL" (ByVal nXfers As Long) As Long
 ' Negotiate with open Source the number of images application will accept.
 ' This is only allowed in State 4 (TWAIN_SOURCE_OPEN)
 ' nXfers = -1 means any number

Declare Function TWAIN_NegotiatePixelTypes Lib "EZTW32.DLL" (ByVal wPixTypes As Long) As Long
 ' Negotiate with the source to restrict pixel types that can be acquired.
 ' This tries to restrict the source to a *set* of pixel types,
 ' See TWAIN_AcquireNative above for some mask constants.
 ' --> This is only allowed in State 4 (TWAIN_SOURCE_OPEN)
 ' A parameter of 0 (TWAIN_ANYTYPE) causes no negotiation & no restriction.
 ' You should not assume that the source will honor your restrictions, even
 ' if this call succeeds!

Declare Function TWAIN_GetCurrentUnits Lib "EZTW32.DLL" () As Long
 ' Ask the source what its current unit of measure is.
 ' If anything goes wrong, this function just returns TWUN_INCHES (0).

Declare Function TWAIN_SetCurrentUnits Lib "EZTW32.DLL" (ByVal nUnits As Long) As Long
 ' Set the current unit of measure for the source.
 ' Unit of measure codes are in TWAIN.H, but TWUN_INCHES is 0.

Declare Function TWAIN_GetBitDepth Lib "EZTW32.DLL" () As Long
 ' Get the current bitdepth, which can depend on the current PixelType.
 ' Bit depth is per color channel e.g. 24-bit RGB has bit depth 8.
 ' If anything goes wrong, this function returns 0.

Declare Function TWAIN_SetBitDepth Lib "EZTW32.DLL" (ByVal nBits As Long) As Long
 ' (Try to) set the current bitdepth (for the current pixel type).

Declare Function TWAIN_GetPixelType Lib "EZTW32.DLL" () As Long
 ' Ask the source for the current pixel type.
 ' If anything goes wrong (it shouldn't), this function returns 0 (TWPT_BW).

Declare Function TWAIN_SetCurrentPixelType Lib "EZTW32.DLL" (ByVal nPixType As Long) As Long
 ' (Try to) set the current pixel type for acquisition.
 ' This is only allowed in State 4 (TWAIN_SOURCE_OPEN)
 ' The source may select this pixel type, but don't assume it will.

Declare Function TWAIN_GetCurrentResolution Lib "EZTW32.DLL" () As Double
 ' Ask the source for the current resolution.
 ' Resolution is in dots per current unit! (See TWAIN_GetCurrentUnits above)
 ' If anything goes wrong (it shouldn't) this function returns 0.0

Declare Function TWAIN_SetCurrentResolution Lib "EZTW32.DLL" (ByVal dRes As Double) As Long
 ' (Try to) set the current resolution for acquisition.
 ' Resolution is in dots per current unit! (See TWAIN_GetCurrentUnits above)
 ' This is only allowed in State 4 (TWAIN_SOURCE_OPEN)
 ' Note: The source may select this resolution, but don't assume it will.

Declare Function TWAIN_SetContrast Lib "EZTW32.DLL" (ByVal dCon As Double) As Long
Declare Function TWAIN_SetBrightness Lib "EZTW32.DLL" (ByVal dBri As Double) As Long



