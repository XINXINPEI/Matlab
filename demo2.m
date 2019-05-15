function varargout = demo2(varargin)
% DEMO2 MATLAB code for demo2.fig
%      DEMO2, by itself, creates a new DEMO2 or raises the existing
%      singleton*.
%
%      H = DEMO2 returns the handle to a new DEMO2 or the handle to
%      the existing singleton*.
%
%      DEMO2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMO2.M with the given input arguments.
%
%      DEMO2('Property','Value',...) creates a new DEMO2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before demo2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to demo2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help demo2

% Last Modified by GUIDE v2.5 28-Apr-2019 16:42:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @demo2_OpeningFcn, ...
                   'gui_OutputFcn',  @demo2_OutputFcn, ...
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


% --- Executes just before demo2 is made visible.
function demo2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to demo2 (see VARARGIN)

% Choose default command line output for demo2
handles.output = hObject;

set(handles.edit1,'String',pwd);
set(handles.edit2,'String',pwd);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes demo2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = demo2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%% --- Executes on button press in button1.
function button1_Callback(hObject, eventdata, handles)
% hObject    handle to button1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = uigetdir; %�����ļ���ѡ��
if a == 0 
else
    set(handles.edit1,'String',a);
    %��ѡ�����ݷ����ı�����
end


%% --- Executes on button press in button2.
function button2_Callback(hObject, eventdata, handles)
% hObject    handle to button2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = uigetdir; %�����ļ���ѡ��
if a == 0 
else
    set(handles.edit2,'String',a);
    %��ѡ�����ݷ����ı�����
end


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


% --- Executes on button press in button3.
function button3_Callback(hObject, eventdata, handles)
% hObject    handle to button3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%��ȡGUI��������ݣ�ģ�͵�ַ����Ŀ����

pathModel = get(handles.edit1,'String');
pathExcel = get(handles.edit2,'String');
pName = get(handles.edit3,'String');
[a,modelList,excelList] = check1(pathModel,pathExcel);
disp('-------��ʼ���.........-------------');
try
    modelName = clName(modelList,1,4); %ȥ��ǰ��׺
    excelName = clName(excelList,length(pName)+2,5); %ȥ��ǰ��׺
    if a ==0
        [len1,~] = size(modelName);
        [len2,~] = size(excelName);
        %% �Ƚ�ģ�ͺ����ݸ����Ķ��٣����ҵ�ȱʧ�����ݻ�ģ��
        if len1>len2
            disp('ģ�Ͷ�������');
            for i=1:len1
                flag=0;
                for j = 1:len2
                    if strcmp(modelName{i,1},excelName{j,1})
                        flag=1;
                    end
                end
                if flag==0
                    disp(['δ�ҵ�-',modelName{i,1},'-���Ӧ��EXCEL����']);
                end
            end
        else
            disp('���ݶ���ģ��');
            for i=1:len2
                flag=0;
                for j = 1:len1
                    if strcmp(excelName{i,1},modelName{j,1})
                        flag=1;
                    end
                end
                if flag==0
                    disp(['δ�ҵ�-',excelName{i,1},'-���Ӧ��MODEL����']);
                end
            end
        end
               
        h = errordlg('�ļ�������ƥ��','����'); 
    else
        x = check2(pathModel,pathExcel,modelList,excelList,modelName,excelName);
        if x == 1
            h = errordlg('�д�����������ڲ鿴','����'); 
        else
            h = msgbox('û���⣡������','���');
        end
    end
catch
    
     h = errordlg('δ�ҵ��ļ�','����'); 
end


% --- Executes on button press in button4.
function button4_Callback(hObject, eventdata, handles)
% hObject    handle to button4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pathModel = get(handles.edit1,'String');
pathExcel = get(handles.edit2,'String');
pName = get(handles.edit3,'String');

oldFolder = cd(pathModel);

[~,modelList,excelList] = check1(pathModel,pathExcel);
modelName = clName(modelList,1,4); %ȥ��ǰ��׺
excelName = clName(excelList,length(pName)+2,5); %ȥ��ǰ��׺
%����ĸ��������࣬��һ������Ѿ���ɣ�
[lengthSlx,~] = size(modelName);
[lengthXlsx,~] = size(excelName);
    %��������ȣ���ȡexcel�б�����
    if lengthSlx == lengthXlsx
        dataList = cell(lengthSlx,1);
%---------------------------------------------------------------------
        f = waitbar(0,'Loading...','Name','���ݶ�ȡ...',...
            'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');

        setappdata(f,'canceling',0);
        formatSpec = 'The current excel is: %d/%d';
        %��ȡexcel�б����ݲ�����
        for i = 1:lengthXlsx
           %--------������------------
            if getappdata(f,'canceling')
                break
            end
            waitbar(i/lengthXlsx,f,sprintf(formatSpec,i,lengthXlsx));
           %-------------------------          
            dataList{i,1} = readExcelData([pathExcel,'\',excelList{i}]);
        end
        
        delete(f);
        %��������ģ��
%---------------------------------------------------------------------------------
        f2 = waitbar(0,'Loading...','Name','д�����...',...
            'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');

        setappdata(f2,'canceling',0);
        formatSpec2 = 'The current model is: %d/%d';
        for i =1:lengthSlx
            %����ϵͳ��д�����ݣ�����ģ�ͣ��ر�ģ��
            if strcmpi(modelName{i},excelName{i})
               load_system(modelList{i});
               %--------������------------
                if getappdata(f2,'canceling')
                    break
                end
                waitbar(i/lengthSlx,f2,sprintf(formatSpec2,i,lengthSlx));
               %-------------------------
              % disp(['===========',num2str(i),'/',num2str(lengthSlx),'=================']); 
               try
               ioWriteDiscription(dataList{i,1},modelName{i});
               catch
                   disp(['��---',num2str(i),'---��ģ��---',modelName{i},'---�����д���,д��ʧ��']);
               end
               save_system(modelList{i});
               close_system(modelList{i});
            end    
        end
        pause(.5);
        delete(f2);
    end
    
cd(oldFolder);
disp('===========Game Over=================');  


   
    
function [a,modelName,excelName] = check1(pathModel,pathExcel)%�����ѡ�ļ������Ƿ����
%oldFolder = cd(pathModel);
%����ģ���ļ��У����������ļ���

%�����ļ�����
[modelName, len1]= fileProcess(pathModel,'slx');
[excelName, len2]= fileProcess(pathExcel,'xlsx');
if len1==len2
    a = 1;
else
    a = 0;
end

function x = check2(pathModel,pathExcel,modelList,excelList,modelName,excelName)%���ÿ��ģ���ڽӿ��������ṩ�������Ƿ�һ��
%����ģ���ļ��У����������ļ���
%��ȡ��������
x = 0;
[len,~] = size(modelList);
dataList = cell(len,1);

%-----------------������------------------
        f4 = waitbar(0,'Loading...','Name','���ݶ�ȡ...',...
            'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');

        setappdata(f4,'canceling',0);
        formatSpec4 = 'The current excel is: %d/%d';
%------------------------------------------------------
 for i = 1:len
          dataList{i,1} = readExcelData([pathExcel,'\',excelList{i}]);
            %--------������------------
            if getappdata(f4,'canceling')
                break;
            end
            waitbar(i/len,f4,sprintf(formatSpec4,i,len));
            %-------------------------
 end
 
 delete(f4);
 
oldFolder = cd(pathModel);
%���Ҹ���  
%-----------------������------------------
        f1 = waitbar(0,'Loading...','Name','������...',...
            'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');

        setappdata(f1,'canceling',0);
        formatSpec1 = 'The current model is: %d/%d';
%------------------------------------------------------
for i = 1:len
    [num1,~] = size(dataList{i,1});
   %����ϵͳ���Ƚ����ݣ�����ģ�ͣ��ر�ģ��
    if strcmpi(modelName{i},excelName{i})
       load_system(modelName{i});
        %--------������------------
        if getappdata(f1,'canceling')
            break
        end
        waitbar(i/len,f1,sprintf(formatSpec1,i,len));
        %-------------------------
        % ����ģ�ͣ����������������
        mdlsys = modelName{i};
        inBlockHandle=find_system(mdlsys,'FindAll','on','SearchDepth','1','BlockType','Inport');
        outBlockHandle=find_system(mdlsys,'FindAll','on','SearchDepth','1','BlockType','Outport');
        [inbknum,~]=size(inBlockHandle);
        [outbknum,~]=size(outBlockHandle);
        if inbknum == 1
            inbkName{1,1}=get(inBlockHandle,'Name');
        else
            inbkName=get(inBlockHandle,'Name');
        end
        
        if outbknum == 1
            outbkName{1,1}=get(outBlockHandle,'Name');
        else
            outbkName=get(outBlockHandle,'Name');
        end
        bkname = vertcat(inbkName,outbkName);
        num2 = inbknum + outbknum;
        s =dataList{i,1}(:,3);
         if num1 ~= num2
             x = 1;
             disp(['��---',num2str(i),'---��ģ��---',modelName{i},'---���ݸ�������']);
         else
             for j = 1:num1
                 if ~strcmp(bkname{j,1},s{j,1})
                     x = 1;
                     if i<=inbknum
                         disp(['��---',num2str(i),'---��ģ��---',modelName{i},'---��-',num2str(j),'������ӿ���������']);
                     else
                         disp(['��---',num2str(i),'---��ģ��---',modelName{i},'---��-',num2str(j-inbknum),'������ӿ���������']);
                     end
                         
                 end
             end
             
         end
         clear inbkName outbkName bkname;
       save_system(modelList{i});
       close_system(modelList{i});
    end   
end
pause(.5);
delete(f1);
cd(oldFolder);



 

function cellName = clName(cellIN,numPrefix,numSuffix) %ȥ��ǰ׺�ͺ�׺
 [len, ~] = size(cellIN);
 
for i= 1:len
    gscName = cellIN{i};%��һ���ļ�����
    [~, siz] = size(gscName); %��һ���ļ����Ƴ���
    name = gscName(numPrefix:siz-numSuffix); %ȥ��ǰ��׺
    Namecell{i} = name;
   cellName = Namecell';
end
%end




    
        
function [fileName, len]= fileProcess(path,suffix) %��ȡ�ļ�����ָ����׺���ļ��������б�
%��ȡ�ļ�����ָ����׺���ļ�
files = dir([path,'\*.',suffix]);
[len,~] = size(files);
%�����յ�Ԫ��
fileName = cell(len,1);
%�ļ������Ƶ��µ�Ԫ�鲢����
for i = 1:len
    fileName{i,1} = files(i).name;
end
%end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dataCell = readExcelData(name)
    [~,~,RAW] = xlsread(name,3); %�ӱ���ȡ����
    %��ȡ��Ч���ݲ�ȥ��ͷ
    dn = deleteNan(RAW);
    dataCelladdHeader = deleteEmpty(dn);
    [heightDataCelladdHeader, ] = size(dataCelladdHeader);
    dataCell = dataCelladdHeader(2:heightDataCelladdHeader,:);
%end

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


function ioWriteDiscription(cell,mdlName)
%��ȡ��ǰģ����
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
                          disp(['ģ��',mdlsys,'��---1---������ӿ���������']);
                        end
                else  %�������һ���ź�ʱ��outbkName��Ԫ��
                       if strcmpi(inbkName{i},inCell{i,3})
                           set_param(inBlockHandle(i), 'Description',discription);
                       else
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
                    disp(['ģ��',mdlsys,'��---1---������ӿ���������']);    
                end
            else    
                   %�������һ���ź��ǣ�outbkName��Ԫ��
                if strcmpi(outbkName{i},outCell{i,3})
                   set_param(outBlockHandle(i), 'Description',discription);
                else
                   disp(['ģ��',mdlsys,'��---',num2str(i),'---������ӿ���������']);
                end
            end    
        end
    end 
else
disp(['��---',num2str(i),'---��ģ��---',mdlsys,'---�����д���,д��ʧ��']);
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
