function varargout = demo5(varargin)
% DEMO5 MATLAB code for demo5.fig
%      DEMO5, by itself, creates a new DEMO5 or raises the existing
%      singleton*.
%
%      H = DEMO5 returns the handle to a new DEMO5 or the handle to
%      the existing singleton*.
%
%      DEMO5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMO5.M with the given input arguments.
%
%      DEMO5('Property','Value',...) creates a new DEMO5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before demo5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to demo5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help demo5

% Last Modified by GUIDE v2.5 14-May-2019 15:20:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @demo5_OpeningFcn, ...
                   'gui_OutputFcn',  @demo5_OutputFcn, ...
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


% --- Executes just before demo5 is made visible.
function demo5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to demo5 (see VARARGIN)

% Choose default command line output for demo5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes demo5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = demo5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button2.
function button2_Callback(hObject, eventdata, handles)
% hObject    handle to button2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[sExcelFile,path] = uigetfile('*.xlsx');
if sExcelFile~=0
    set(handles.edit2,'String',[path,sExcelFile]);
end

% --- Executes on button press in button3.
function button3_Callback(hObject, eventdata, handles)
% hObject    handle to button3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pathModel = get(handles.edit1,'String');
pathExcel = get(handles.edit2,'String');
% ��ȡ�������
    [~,~,RAW] = xlsread(pathExcel,3); %�ӱ���ȡ����
    %��ȡ��Ч���ݲ�ȥ��ͷ
    dn = deleteNan(RAW);
    dataCelladdHeader = deleteEmpty(dn);
    [heightDataCelladdHeader, ] = size(dataCelladdHeader);
    dataCell = dataCelladdHeader(2:heightDataCelladdHeader,:);
    % ����ģ�ͣ�д�����ݣ��ر�ģ��
    load_system(pathModel);
    modelName = gcs;
    x = ioWriteDiscription(dataCell,modelName);
    save_system(pathModel);
    if x == 1
        h = errordlg('�д�����������ڲ鿴','����'); 
    else
        h = msgbox('д��ɹ���','д��');
    end
    close_system(pathModel);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button1.
function button1_Callback(hObject, eventdata, handles)
% hObject    handle to button1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[sModelFile,path] = uigetfile('*.slx');
if sModelFile~=0
    set(handles.edit1,'String',[path,sModelFile]);
end

% ������������
%-------------------------------------------------------%%%%%%%%%%%%%%

function newcell = deleteNan(cell)

    [height, width] = size(cell); %��ȡ����ߴ�
    
    %���������NaNԪ�أ����滻
    for i = 1 : height
        for j = 1 : width
            if isnan(cell{i, j})
                cell{i, j}= '';
            end
        end
    end
    
    newcell = cell;
    
%end

function newcell = deleteEmpty(cell) %����ȥ��
    
    [height, ~] = size(cell);   %��ȡ����ߴ�
 
    %�����Ч���ݳ���
    for cnt = 1 : height           
        if isempty(cell{cnt, 3})
            break;
        end
    end
    
    if cnt == height
        newcell = cell(1:cnt,:);  %��ȡ��Ч����
    else
        newcell = cell(1:cnt-1,:);
    end

%end


function x = ioWriteDiscription(cell,mdlName)
%��ȡ��ǰģ����
x = 0;
% mdlsys=gcs; 
mdlsys = mdlName;
%disp(['Current Model is ','<<',mdlsys,'>>']);


%disp('===========Find Handle of IO =================');
%�����е�input��output
inBlockHandle=find_system(mdlsys,'FindAll','on','SearchDepth','1','BlockType','Inport');
outBlockHandle=find_system(mdlsys,'FindAll','on','SearchDepth','1','BlockType','Outport');

%��������ӿڸ���
[inbknum,~]=size(inBlockHandle);
[outbknum,~]=size(outBlockHandle);
%�������Ϊ���룬�����������
inCell=cell(1:inbknum,:);
outCell=cell(1+inbknum:inbknum+outbknum,:);

[lencell,~]=size(cell);
if lencell==(inbknum+outbknum)
    % ioBlockHandle = [inblockhandle;outblockhandle];
    % ioName = get(ioBlockHandle,'Name');

    % ��ȡ�����ź�����
    inbkName=get(inBlockHandle,'Name');
    outbkName=get(outBlockHandle,'Name');
    % inbktype=get(inblockhandle,'OutDataTypeStr');
    % outbktype=get(outblockhandle,'OutDataTypeStr');
    % inbksize=get(inblockhandle,'PortDimensions');
    % outbksize=get(outblockhandle,'PortDimensions');
    % inbkDesp=get(inblockhandle,'Description');
    % outbkDesp=get(outblockhandle,'Description');
    %disp('===========Start IO Description Write=================');
    %ͬ���жϣ�Ȼ�������д��ע��
    if inbknum~=0
            for i = 1:inbknum
                %���ϱ��9-15�е�ֵ
                %---------1------------
                factorData = inCell{i,9};
                if isempty(factorData)
                    factor = '*';
                else
                    factor = all2str(factorData);
                end
                %---------2------------
                offsetData = inCell{i,10};
                if isempty(offsetData)
                    offset = '*';
                else
                    offset = all2str(offsetData);
                end
                %---------3------------
                unitData = inCell{i,11};
                if isempty(unitData)
                    unit = '*';
                else
                    unit = all2str(unitData);
                end
                %---------4------------
                maxData = inCell{i,12};
                if isempty(maxData)
                    max = '*';
                else
                    max = all2str(maxData);
                end
                %---------5------------
                minData = inCell{i,13};
                if isempty(minData)
                    min = '*';
                else
                    min = all2str(minData);
                end
                %--------6-------------
                descripData = inCell{i,14};
                if isempty(descripData)
                    descrip = '*';
                else
                    descrip = all2str(descripData);
                end
                %---------7------------
                commentData = inCell{i,15};
                if isempty(commentData)
                    comment = '*';
                else
                    comment = all2str(commentData);
                end
                %---------------------    
                %�����ַ���
                discription = [factor, ' # ',offset, ' # ', unit, ' # ', max, ' # ', min, ' # ',descrip,' # ',comment];
                %д��
                if inbknum == 1 %���һ���ź��ǣ�inbkName����Ԫ��
                        if strcmpi(inbkName,inCell{i,3})
                           set_param(inBlockHandle(i), 'Description',discription);
                        else
                          x = 1;
                          disp(['ģ��',mdlsys,'��---1---������ӿ���������']);
                        end
                else  %�������һ���ź�ʱ��outbkName��Ԫ��
                       if strcmpi(inbkName{i},inCell{i,3})
                           set_param(inBlockHandle(i), 'Description',discription);
                       else
                           x = 1;
                           disp(['ģ��',mdlsys,'��---',num2str(i),'---������ӿ���������']);
                       end 
                end

            end
    end
    %ͬ���жϣ�Ȼ������д��ע��
    if outbknum~=0
        for i = 1:outbknum
            %���ϱ��9-15�е�ֵ
             %---------1------------
                factorData = outCell{i,9};
                if isempty(factorData)
                    factor = '*';
                else
                    factor = all2str(factorData);
                end
                %---------2------------
                offsetData = outCell{i,10};
                if isempty(offsetData)
                    offset = '*';
                else
                    offset = all2str(offsetData);
                end
                %---------3------------
                unitData = outCell{i,11};
                if isempty(unitData)
                    unit = '*';
                else
                    unit = all2str(unitData);
                end
                %---------4------------
                maxData = outCell{i,12};
                if isempty(maxData)
                    max = '*';
                else
                    max = all2str(maxData);
                end
                %---------5------------
                minData = outCell{i,13};
                if isempty(minData)
                    min = '*';
                else
                    min = all2str(minData);
                end
                %--------6-------------
                descripData = outCell{i,14};
                if isempty(descripData)
                    descrip = '*';
                else
                    descrip = all2str(descripData);
                end
                %---------7------------
                commentData = outCell{i,15};
                if isempty(commentData)
                    comment = '*';
                else
                    comment = all2str(commentData);
                end
            %---------------------    
            %�����ַ���
            discription = [factor, ' # ',offset, ' # ', unit, ' # ', max, ' # ', min, ' # ',descrip,' # ',comment];
            %д��
            if outbknum == 1  %���һ���ź��ǣ�outbkName����Ԫ��
                if strcmpi(outbkName,outCell{i,3})
                   set_param(outBlockHandle(i), 'Description',discription);
                else
                    x = 1;
                    disp(['ģ��',mdlsys,'��---1---������ӿ���������']);    
                end
            else    
                   %�������һ���ź��ǣ�outbkName��Ԫ��
                if strcmpi(outbkName{i},outCell{i,3})
                   set_param(outBlockHandle(i), 'Description',discription);
                else
                    x = 1;
                   disp(['ģ��',mdlsys,'��---',num2str(i),'---������ӿ���������']);
                end
            end    
        end
    end 
else
    x = 1;
    disp(['ģ��---',mdlsys,'---�����д���,д��ʧ��']);
end
%disp('===========IO Description Write End=================')
% save(modelsys)
%end

function out = all2str(in)
    inType = class(in); %��ʾ��������
    %���Ϊ�������ͣ���תΪ�ַ���
    if strcmpi(inType,'double')||strcmpi(inType,'single')||strcmpi(inType,'int8')||strcmpi(inType,'int16')||strcmpi(inType,'int32')||strcmpi(inType,'int64')||strcmpi(inType,'uint8')||strcmpi(inType,'uint16')||strcmpi(inType,'uint32')||strcmpi(inType,'uint64')
        out = num2str(in);
    else
        out = in;
    end
    %end
