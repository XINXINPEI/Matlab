function varargout = demo1(varargin)
% DEMO1 MATLAB code for demo1.fig
%      DEMO1, by itself, creates a new DEMO1 or raises the existing
%      singleton*.
%
%      H = DEMO1 returns the handle to a new DEMO1 or the handle to
%      the existing singleton*.
%
%      DEMO1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMO1.M with the given input arguments.
%
%      DEMO1('Property','Value',...) creates a new DEMO1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before demo1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to demo1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help demo1

% Last Modified by GUIDE v2.5 23-Apr-2019 09:23:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @demo1_OpeningFcn, ...
                   'gui_OutputFcn',  @demo1_OutputFcn, ...
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


% --- Executes just before demo1 is made visible.
function demo1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to demo1 (see VARARGIN)

% Choose default command line output for demo1
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
set(handles.edit1,'String',pwd);
set(handles.edit2,'String',pwd);

% UIWAIT makes demo1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = demo1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button1.
function button1_Callback(hObject, eventdata, handles)
% hObject    handle to button1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sFbutton1 = uigetdir;
if sFbutton1 ==0
    set(handles.edit1,'String',pwd);
else
    set(handles.edit1,'String',sFbutton1);
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


% --- Executes on button press in button2.
function button2_Callback(hObject, eventdata, handles)
% hObject    handle to button2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sFbutton2 = uigetdir;
if sFbutton2 ==0

else
    set(handles.edit2,'String',sFbutton2);
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



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = get(handles.edit3,'String');
writeModelData2Excel(a,get(handles.edit2,'String'),get(handles.edit1,'String'));




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

function writeModelData2Excel(str,outpath,modelPath)
    cd(modelPath);
    [inCellArray,outCellArray] = allInOutSignal();
    %mkdir Farmework;
    mkdir(outpath,'Framework');
    path = [outpath,'\'];
    
    model = dir([pwd,'\*.slx']);
    %���ҵ�����ģ���ļ�����ֵ��Ԫ������
    [len,~] = size(model);
    allModel = cell(len,1);
    for i = 1:len
    allModel{i,1} = model(i).name;
    end
    %ȥ����׺����ȡģ����
    allName = clName(allModel,1,4);
    
    %��ͷ
    sheet1Header = {'ID', '��������', '�ؼ�����'};
    excelHeader = {'ID', 'Task', 'SignalName','SourcesBlock','OutputBlock', 'DataType', 'PortType', 'Dimension', 'Factor', 'Offset', 'Unit', 'Max', 'Min', 'Description', 'Comment'};
    %---------------------------------------------------------------------------------
        f2 = waitbar(0,'Loading...','Name','��������...',...
            'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');

        setappdata(f2,'canceling',0);
        formatSpec2 = 'The current excel write: %d/%d';
    %--------------------------------------------------------
    for i =1:len
        mdlsys = allName{i,1};
        disp([num2str(i),'/',num2str(len),'----Modle Name------',mdlsys,'---------']);
       %--------������------------
        if getappdata(f2,'canceling')
            break
        end
        waitbar(i/len,f2,sprintf(formatSpec2,i,len));
       %-------------------------
        projectName = [path,'Framework\',str];
        load_system(mdlsys);
       DataCell = findBlockData(mdlsys,inCellArray,outCellArray);
        allDataCell = deleteStar(vertcat(excelHeader,DataCell));
        xlswrite([projectName, '_',mdlsys,'.xlsx'],sheet1Header, '��������','A1');
        xlswrite([projectName, '_',mdlsys,'.xlsx'],allDataCell,'�������','A1');
        %��ȡģ�����������Ϣ
%         eval(['[~,~,',mdlsys,'DataCell] = findBlockData(mdlsys,inCellArray,outCellArray);']);
%         
%         %д��
%         disp(['----Writing------',mdlsys,'---------']);
%         xlswrite([projectName, '_',mdlsys,'.xlsx'],sheet1Header, '��������','A1');
%        
%         eval( ['xlswrite([projectName, ''_'',mdlsys,''.xlsx''],all',mdlsys,'DataCell,''�������'',''A1'');']);
%         eval(['all',mdlsys,'DataCell = vertcat(excelHeader,',mdlsys,'DataCell);']); 
%         % xlswrite([projectName, '_',mdlsys,'.xlsx'],SFGDataCell,'�������','A1');
        close_system(mdlsys);
    end
    pause(.5);
    delete(f2);
    disp('----ALL PROGRAMS GAME OVER--------------');
%end

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


%�������������źź�����ź�
function [inCellArray,outCellArray] = allInOutSignal()
    model = dir([pwd,'\*.slx']);
    %���ҵ�����ģ���ļ�����ֵ��Ԫ������
    [len,~] = size(model);
    allModel = cell(len,1);
    for i = 1:len
    allModel{i,1} = model(i).name;
    end
    %ȥ����׺����ȡģ����
    allName = clName(allModel,1,4);
    %-----------------------------------------------
    f = waitbar(0,'Loading...','Name','���ݶ�ȡ...',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');

    setappdata(f,'canceling',0);
    formatSpec = 'The current model read: %d/%d';
    %-----------------------------------------------
    %����ϵͳ����ȡ���ݣ��ر�ģ��
    for i =1:len
        mdlsys = allName{i,1};
        disp([num2str(i),'/',num2str(len),'----Modle Name------',mdlsys,'---------']);
        load_system(mdlsys);
        %--------������------------
        if getappdata(f,'canceling')
            break
        end
        waitbar(i/len,f,sprintf(formatSpec,i,len));
        %-------------------------  
        inblockhandle=find_system(mdlsys,'FindAll','on','SearchDepth','1','BlockType','Inport');
        outblockhandle=find_system(mdlsys,'FindAll','on','SearchDepth','1','BlockType','Outport');
        %�����������
        [inbknum,~]=size(inblockhandle);
        [outbknum,~]=size(outblockhandle);
        %��ȡ�����ź���������ģ����
        if inbknum~=0
            %eval([mdlsys,'inbkName = get(inblockhandle,','''Name'');']);
            inbkName=get(inblockhandle,'Name');
            bkNameIn = cell(inbknum,1);
            for j=1:inbknum
                bkNameIn{j,1}= mdlsys;
            end
            %������������
            eval(['in',mdlsys,'= horzcat(bkNameIn,inbkName);']);
        else
            %������������
            eval(['in',mdlsys,'= cell(0,0);']);
        end
        
        
        %��ȡ����ź���������ģ����
        if outbknum~=0
            outbkName=get(outblockhandle,'Name');
            bkNameOut = cell(outbknum,1);
            for j=1:outbknum
                bkNameOut{j,1}= mdlsys;
            end   
            %�����������
            eval(['out',mdlsys,'= horzcat(bkNameOut,outbkName);']);
        else
            %�����������
            eval(['out',mdlsys,'= cell(0,0);']);
        end
        save_system(allModel{i,1});
        %�ر�ģ��
        close_system(allModel{i,1});        
    end
    delete(f);
    
    %�ϲ���������ź�
    disp('--------------vertcat IN/OUT signal---------------');
    eval(['inCellArray = in',allName{1,1},';']);
    if len > 1
        for i = 2:len
            eval( ['inCellArray = vertcat(inCellArray,in',allName{i,1},');']);
        end    
    end 
    %�ϲ��������ź�
    eval(['outCellArray = out',allName{1,1},';']);
    if len > 1
        for i = 2:len
            eval( ['outCellArray = vertcat(outCellArray,out',allName{i,1},');']);
        end    
    end 
    disp('--------------GAME OVER---------------');
%end


function sum = putTogether(inDesp) %�������
if isempty(inDesp)
    len = 1;
else
[len,~] = size(inDesp); %��ȡ�������鳤��
end
%�����֣����������
if len == 1
    a1 = strsplit(inDesp,' # ');
else
    for i = 1:len
        eval(['a',num2str(i),' = strsplit(inDesp{', num2str(i), ',1},',''' # ''',');']);
    end
end
%�ϲ����
sum = a1;
if len > 1 
    for i = 2:len
        eval(['sum = vertcat(sum,a',num2str(i),');']);
    end
end

%end


function num = strFindChar(str,char) %�����Զ��ַ����ַ����еĸ���
    idx = strfind(str,char); %�����Զ��ַ����ַ����е�λ��
    num = length(idx); %����

%end


function allCellArray = findBlockData(str,allIN,allOUT)
mdlsys=str;
disp(['Current Model is ','<<',mdlsys,'>>']);

disp('===========Signal information check Start=================');
%�����е�input��output
inblockhandle=find_system(mdlsys,'FindAll','on','SearchDepth','1','BlockType','Inport');
outblockhandle=find_system(mdlsys,'FindAll','on','SearchDepth','1','BlockType','Outport');
%�����������
[inbknum,~]=size(inblockhandle);
[outbknum,~]=size(outblockhandle);

 %�ź�Դ����
 lenIN = length(allIN);
 lenOUT = length(allOUT);

if inbknum ~=0
    %�����������ڴ�--����
    inbkID = cell(inbknum,1);
    inbkTask = cell(inbknum,1);
    % inbkName = cell(inbknum,1);
    inSourcesBk = cell(inbknum,1);
    in_outTargetBk = cell(inbknum,1);
    % inbkType = cell(inbknum,1);
    inbkPortType = cell(inbknum,1);
    % inbkSize = cell(inbknum,1);
    inbkFactor = cell(inbknum,1);
    inbkOffset = cell(inbknum,1);
    inbkUnit = cell(inbknum,1);
    inbkMax = cell(inbknum,1);
    inbkMin = cell(inbknum,1);
    inbkDescrip = cell(inbknum,1);
    inbkComment = cell(inbknum,1);
    
    
    
    inbkName=get(inblockhandle,'Name');
    inbkType=get(inblockhandle,'OutDataTypeStr');
    inbkSize=get(inblockhandle,'PortDimensions');
    %��ȡDesp���ݲ����
    inbkDesp=get(inblockhandle,'Description');
    inBlockDesp = putTogether(inbkDesp);
    
    
    % ��ֳ���Ҫ������ �����ź�
    for i = 1:inbknum
        
         if inbknum == 1
            inbknumCondition = inbkDesp;
         else
            inbknumCondition = inbkDesp{i,1};
         end
        
        if isempty(inbknumCondition)
            inbkFactor{i,1} = '';
            inbkOffset{i,1} = '';
            inbkUnit{i,1} = '';
            inbkMax{i,1} = '';
            inbkMin{i,1} = '';
            inbkDescrip{i,1} = ' ';
            inbkComment{i,1} = '';
        elseif strFindChar(inbknumCondition,' # ')==6
            inbkFactor{i,1} =inBlockDesp{i,1};
            inbkOffset{i,1} = inBlockDesp{i,2};
            inbkUnit{i,1} =inBlockDesp{i,3};
            inbkMax{i,1} = inBlockDesp{i,4};
            inbkMin{i,1} = inBlockDesp{i,5};
            inbkDescrip{i,1} = inBlockDesp{i,6};
            inbkComment{i,1} = inBlockDesp{i,7};
        else
            inbkFactor{i,1} = '';
            inbkOffset{i,1} = '';
            inbkUnit{i,1} = '';
            inbkMax{i,1} = '';
            inbkMin{i,1} = '';
            inbkDescrip{i,1} = inBlockDesp{i,1};
            inbkComment{i,1} = '';
        end
    end  
    
    for i = 1:inbknum
    inbkID{i,1}= i; %inbk ------in block����ģ��
    inbkTask{i,1} = ['Runnable_', mdlsys];
    inbkPortType{i,1}= 'Receiver';
    in_outTargetBk{i,1} = '';
    end
    
   
    %�����ź�Դ����
    
    if lenOUT ~=0
       for index = 1:inbknum
           %����������в��Ҹ��ź�
           cnt=0;
           for k = 1:lenOUT
                if inbknum==1
                    inbkN = inbkName;
                else
                    inbkN = inbkName{index,1};
                end
                
               if strcmpi(inbkN,allOUT{k,2})
                   if cnt == 0
                       inSourcesBk{index,1} = allOUT{k,1};
                       cnt = 1;
                   else
                       inSourcesBk{index,1} = [inSourcesBk{index,1},',',allOUT{k,1}];
                   end
               end
           end
           cnt = 0;
           %��δ�ҵ������ʾ���Եײ�
           if isempty(inSourcesBk{index,1})
               inSourcesBk{index,1} = 'BSW';
           end
           
       end
    end    
    
    
    
    %������������
    inCellArray=horzcat(inbkID,inbkTask,inbkName,inSourcesBk,in_outTargetBk,inbkType,inbkPortType, inbkSize, inbkFactor, inbkOffset, inbkUnit, inbkMax, inbkMin, inbkDescrip, inbkComment);
end  

if outbknum ~=0
    %�����������ڴ�--���
    outbkID = cell(outbknum,1);
    outbkTask = cell(outbknum,1);
    % outbkName = cell(outbknum,1);
    out_inSourcesBk = cell(outbknum,1);
    outTargetBk = cell(outbknum,1);
    % outbkType = cell(outbknum,1);
    outbkPortType = cell(outbknum,1);
    % outbkSize = cell(outbknum,1);
    outbkFactor = cell(outbknum,1);
    outbkOffset = cell(outbknum,1);
    outbkUnit = cell(outbknum,1);
    outbkMax = cell(outbknum,1);
    outbkMin = cell(outbknum,1);
    outbkDescrip = cell(outbknum,1);
    outbkComment = cell(outbknum,1);

    % % ��ͷ
    % disp('===========IO Signal Excel Generation Start=================')
    % %inputexcelcontent={'Input','No','SignalName','DataType','Dimension'};
    % %outputexcelcontent={'Output','No','SignalName','DataType','Dimension'};
    % sheet1Header = {'ID', '��������', '�ؼ�����'};
    % excelHeader = {'ID', 'Task', 'SignalName', 'DataType', 'PortType', 'Dimension', 'Factor', 'Offset', 'Uint', 'Max', 'Min', 'Description', 'Comment'};

    %��ȡ��Ϣ
    outbkName=get(outblockhandle,'Name');
    outbkType=get(outblockhandle,'OutDataTypeStr');
    outbkSize=get(outblockhandle,'PortDimensions');
    %��ȡDesp���ݲ����
    outbkDesp=get(outblockhandle,'Description');
    outBlockDesp =putTogether(outbkDesp);

    % ��ֳ���Ҫ������ ����ź�
    
    for i = 1:outbknum
        if outbknum == 1
            outbknumCondition = outbkDesp;
        else
            outbknumCondition = outbkDesp{i,1};
        end
        
        if isempty(outbknumCondition)
            outbkFactor{i,1} = '';
            outbkOffset{i,1} = '';
            outbkUnit{i,1} = '';
            outbkMax{i,1} = '';
            outbkMin{i,1} = '';
            outbkDescrip{i,1} = ' ';
            outbkComment{i,1} = '';
        elseif strFindChar(outbknumCondition,' # ')==6
            outbkFactor{i,1} =outBlockDesp{i,1};
            outbkOffset{i,1} = outBlockDesp{i,2};
            outbkUnit{i,1} =outBlockDesp{i,3};
            outbkMax{i,1} = outBlockDesp{i,4};
            outbkMin{i,1} = outBlockDesp{i,5};
            outbkDescrip{i,1} = outBlockDesp{i,6};
            outbkComment{i,1} = outBlockDesp{i,7};
        else
            outbkFactor{i,1} = '';
            outbkOffset{i,1} = '';
            outbkUnit{i,1} = '';
            outbkMax{i,1} = '';
            outbkMin{i,1} = '';
            outbkDescrip{i,1} = outBlockDesp{i,1};
            outbkComment{i,1} = '';
        end
    end  

    for i = 1:outbknum
        outbkID{i,1}= i;
        outbkTask{i,1} = ['Runnable_', mdlsys];
        outbkPortType{i,1}= 'Send';
        out_inSourcesBk{i,1} = '';
    end
    
    %�����ź�Դ����

    if lenIN ~=0
       for index = 1:outbknum
           %����������в��Ҹ��ź�
           
           if outbknum==1
               outbkN = outbkName;
           else
                outbkN = outbkName{index,1};
           end
           cnt=0;
           for k = 1:lenIN
               if strcmpi(outbkN,allIN{k,2})
                   if cnt == 0
                       outTargetBk{index,1} = allIN{k,1};
                       cnt = 1;
                   else
                       outTargetBk{index,1} = [outTargetBk{index,1},',',allIN{k,1}];
                   end
               end
           end
           cnt = 0;
           %��δ�ҵ������ʾ���Եײ�
           if isempty(outTargetBk{index,1})
               outTargetBk{index,1} = 'BSW';
           end
           
       end
    end 
    
    %������������
    outCellArray=horzcat(outbkID,outbkTask,outbkName,out_inSourcesBk,outTargetBk,outbkType,outbkPortType, outbkSize, outbkFactor, outbkOffset, outbkUnit, outbkMax, outbkMin,outbkDescrip, outbkComment);
end





% if (inbknum == 0) && (outbknum == 0)
% excelary = vertcat(excelHeader);
% end
% 
% if inbknum == 0
%     excelary = vertcat(excelHeader,outexcelary);
% end
% 
% if outbknum == 0
%    excelary = vertcat(excelHeader,inexcelary); 
% end
if inbknum == 0 && outbknum ~= 0
    allCellArray = outCellArray;
end
if outbknum == 0 && inbknum ~= 0
   allCellArray = inCellArray; 
end
if (inbknum ~= 0) && (outbknum ~= 0)
allCellArray = vertcat(inCellArray,outCellArray);
end
%д��ָ��sheetҳ
% xlswrite([projectName, '_',mdlsys,'.xlsx'],sheet1Header, '��������','A1');
% xlswrite([projectName, '_',mdlsys,'.xlsx'],inCellArray,'�������','A1');



disp('===========IO Signal Excel Generation End=================')
% save(modelsys)
%end

function newcell = deleteStar(cell)

    [height, width] = size(cell); %��ȡ����ߴ�
    cellnum = strcmp('*',cell);
    %���������NaNԪ�أ����滻
    for i = 1 : height
        for j = 1 : width
            if cellnum(i,j) == 1
                cell{i,j}= '';
            end
        end
    end
    
    newcell = cell;

