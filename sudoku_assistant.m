%% �ظ�����
for aa = 1:81
    fprintf('function pushbutton%d_Callback(hObject, eventdata, handles)\n\n', aa)
    fprintf('%% ѡ������\n')
    fprintf('handles.selectLoc = %d;\n\n', aa)
    fprintf('%% Update handles structure\n')
    fprintf('guidata(hObject, handles);\n\n\n')
end