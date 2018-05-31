function varargout = Prak11(varargin)
% PRAK11 MATLAB code for Prak11.fig
%      PRAK11, by itself, creates a new PRAK11 or raises the existing
%      singleton*.
%
%      H = PRAK11 returns the handle to a new PRAK11 or the handle to
%      the existing singleton*.
%
%      PRAK11('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRAK11.M with the given input arguments.
%
%      PRAK11('Property','Value',...) creates a new PRAK11 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Prak11_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Prak11_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Prak11

% Last Modified by GUIDE v2.5 30-May-2017 15:09:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Prak11_OpeningFcn, ...
                   'gui_OutputFcn',  @Prak11_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before Prak11 is made visible.
function Prak11_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Prak11 (see VARARGIN)

% Choose default command line output for Prak11
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Prak11 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = Prak11_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in bStart.
function bStart_Callback(hObject, eventdata, handles)
% hObject    handle to bStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% sesuaikan dengan supporter mode yang dipilih
vid = videoinput('winvideo', 1, 'YUY2_320x240');
vid.FramesPerTrigger = 1;
vid.ReturnedColorspace = 'rgb';
triggerconfig(vid, 'manual');
vidRes = get(vid, 'VideoResolution');
imWidth = vidRes(1);
imHeight = vidRes(2);
nBands = get(vid, 'NumberOfBands');
hImage = image(zeros(imHeight, imWidth, nBands), 'parent', handles.aPreview);
preview(vid, hImage);
handles.vid = vid;
guidata(hObject, handles);

% --- Executes on button press in bCapture.
function bCapture_Callback(hObject, eventdata, handles)
% hObject    handle to bCapture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if ~isfield(handles, 'vid')
    warndlg('Start camera terlebih dahulu');
    return;
end
vid = handles.vid;
vid.FramesPerTrigger = 1;
vid.ReturnedColorspace = 'rgb';
triggerconfig(vid, 'manual');
vidRes = get(vid, 'VideoResolution');
imWidth = vidRes(1);
imHeight = vidRes(2);
nBands = get(vid, 'NumberOfBands');
hImage = image(zeros(imHeight, imWidth, nBands), 'parent', handles.aPreview);
preview(vid, hImage);

start(vid);
pause(1);
trigger(vid);
stoppreview(vid);
capt1 = getdata(vid);
imwrite(capt1, 'captured.png');
warndlg('Done');


test();

