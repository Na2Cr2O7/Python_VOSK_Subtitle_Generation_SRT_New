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
    fso.DeleteFolder folderPath & "\model_cn", True
    fileName = folderPath & "\model_cn"
    If Err.Number = 0 Then
        filesDeleted = "��ɾ���ļ��У�" & fileName & vbNewLine
    Else
        Err.Clear
    End If


    fso.DeleteFolder folderPath & "\model", True
    fileName = folderPath & "\model"
    If Err.Number = 0 Then
        filesDeleted = "��ɾ���ļ��У�" & fileName & vbNewLine
    Else
        Err.Clear
    End If

     fso.DeleteFolder folderPath & "\__MACOSX", True
    fileName = folderPath & "\__MACOSX"
    If Err.Number = 0 Then
        filesDeleted = filesDeleted & "��ɾ���ļ��У�" & fileName & vbNewLine
    Else
        Err.Clear
    End If



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

     fso.DeleteFile folderPath & "\����2Ryan.py"
    fileName = folderPath & "\����2Ryan.py"
    If Err.Number = 0 Then
        filesDeleted = filesDeleted & "��ɾ���ļ���" & fileName & vbNewLine
    Else
        Err.Clear
    End If


     fso.DeleteFile folderPath & "\����2�������[������].bat"
    fileName = folderPath & "\����2�������[������].bat"
    If Err.Number = 0 Then
        filesDeleted = filesDeleted & "��ɾ���ļ���" & fileName & vbNewLine
    Else
        Err.Clear
    End If


     fso.DeleteFile folderPath & "\test_srt.py"
    fileName = folderPath & "\test_srt.py"
    If Err.Number = 0 Then
        filesDeleted = filesDeleted & "��ɾ���ļ���" & fileName & vbNewLine
    Else
        Err.Clear
    End If


     fso.DeleteFile folderPath & "\test_srt_cn.py"
    fileName = folderPath & "\test_srt_cn.py"
    If Err.Number = 0 Then
        filesDeleted = filesDeleted & "��ɾ���ļ���" & fileName & vbNewLine
    Else
        Err.Clear
    End If


     fso.DeleteFile folderPath & "\test_text.py"
    fileName = folderPath & "\test_text.py"
    If Err.Number = 0 Then
        filesDeleted = filesDeleted & "��ɾ���ļ���" & fileName & vbNewLine
    Else
        Err.Clear
    End If


     fso.DeleteFile folderPath & "\test_text_cn.py"
    fileName = folderPath & "\test_text_cn.py"
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

     fso.DeleteFile folderPath & "\����ģ�͵�Ŀ���ļ���.vbs"
    fileName = folderPath & "\����ģ�͵�Ŀ���ļ���.vbs"
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
