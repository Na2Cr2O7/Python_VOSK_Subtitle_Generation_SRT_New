Dim message, title, response, filesDeleted
message = "����Ļ������ϣ��Ƿ�ɾ������Ľű��ļ���" & vbCrLf & _
          "����ȷ�����ѱ��ݺá�" & vbCrLf & _
          "������ɾ����㡱�񡰡���"
title = "��ʾ"
response = MsgBox(message, vbYesNo, title)
filesDeleted = ""

'�������������vbs���ڵ�·���Ķ���(Ҳ������Ƶ·��)
Set objShell = CreateObject("Shell.Application")

'��������"��",��ô�Ϳ�ʼɾ��.
If response = vbYes Then
    Dim fso, folderPath, scriptPath, fileName
    folderPath = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
    Set fso = CreateObject("Scripting.FileSystemObject")

    ' ɾ�������ļ����ļ���
    On Error Resume Next

     fso.DeleteFile folderPath & "\�������ҡ�����������Ƶ�ļ��С�˫����.bat"
    fileName = folderPath & "\�������ҡ�����������Ƶ�ļ��С�˫����.bat"
    If Err.Number = 0 Then
        filesDeleted = filesDeleted & "��ɾ���ļ���" & fileName & vbNewLine
    Else
        Err.Clear
    End If

     fso.DeleteFile folderPath & "\�������ҡ�����Ӣ����Ƶ�ļ��С�˫����.bat"
    fileName = folderPath & "\�������ҡ�����Ӣ����Ƶ�ļ��С�˫����.bat"
    If Err.Number = 0 Then
        filesDeleted = filesDeleted & "��ɾ���ļ���" & fileName & vbNewLine
    Else
        Err.Clear
    End If

     fso.DeleteFile folderPath & "\file_names.txt"
    fileName = folderPath & "\file_names.txt"
    If Err.Number = 0 Then
        filesDeleted = filesDeleted & "��ɾ���ļ���" & fileName & vbNewLine
    Else
        Err.Clear
    End If

     fso.DeleteFile folderPath & "\��ƵĿ¼.txt"
    fileName = folderPath & "\��ƵĿ¼.txt"
    If Err.Number = 0 Then
        filesDeleted = filesDeleted & "��ɾ���ļ���" & fileName & vbNewLine
    Else
        Err.Clear
    End If

     ' ɾ������
    scriptPath = WScript.ScriptFullName
    fso.DeleteFile scriptPath
    fileName = scriptPath
    If Err.Number = 0 Then
        filesDeleted = filesDeleted & "��ɾ���ļ���" & fileName & vbNewLine
    Else
        Err.Clear
    End If
End If

'��ͷ�����Ķ���,���ڴ�vbs���ڵ��ļ�·��������չʾ���ɵ���Ļ�ļ�
objShell.Explore Replace(WScript.ScriptFullName, WScript.ScriptName, "")
'��ɵ���.��ʾɾ������Щ�ļ�
MsgBox "���" & vbNewLine & filesDeleted, vbOKOnly, "��ʾ"
