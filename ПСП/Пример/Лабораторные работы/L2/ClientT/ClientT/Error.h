#include <string>
#include "Winsock2.h" //��������� WS2_32.dll
#pragma comment(lib, "WS2_32.lib") //������� WS2_32.dll
#pragma once
using namespace std;

//������� ��� ������������ ������ ������
string GetErrorMsgText(int code);

//������ ��� ��������� ����������� ������ ���������� WS2_32.dll
string SetErrorMsgText(string msgText, int code);