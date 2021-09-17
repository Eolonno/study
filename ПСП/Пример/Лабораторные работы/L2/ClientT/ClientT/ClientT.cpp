#define _WINSOCK_DEPRECATED_NO_WARNINGS

#include "stdafx.h"
#include <string>
#include <iostream>
#include "Winsock2.h" //��������� WS2_32.dll
#pragma comment(lib, "WS2_32.lib") //������� WS2_32.dll
#include "Error.h"
#include <ctime>

using namespace std;

int main()
{
	setlocale(LC_ALL, "rus");
	WSADATA wsaData;

	SOCKET cC; //��������� �����

	SOCKADDR_IN serv; //��������� ������ �������
	serv.sin_family = AF_INET; //������������ IP-���������
	serv.sin_port = htons(2000); //TCP-���� 2000
	serv.sin_addr.s_addr = inet_addr("127.0.0.1"); //����� �������

	char ibuf[50] = "server: get "; //����� ������
	int libuf = 0; //���������� ������������ ����
	int lobuf = 0; //���������� �������� ����

	clock_t start, stop;
	try
	{
		if (WSAStartup(MAKEWORD(2, 0), &wsaData) != 0)
			throw SetErrorMsgText("Startup: ", WSAGetLastError());

		if ((cC = socket(AF_INET, SOCK_STREAM, NULL)) == INVALID_SOCKET)
			throw SetErrorMsgText("socket: ", WSAGetLastError());

		if ((connect(cC, (sockaddr*)&serv, sizeof(serv))) == SOCKET_ERROR)
			throw SetErrorMsgText("connect: ", WSAGetLastError());
		int count;
		cout << "Number of messages: ";
		cin >> count;

		start = clock();
		for (int i = 1; i <= count; i++)
		{
			string obuf = "Hello from Client " + to_string(i);
			if ((lobuf = send(cC, obuf.c_str(), strlen(obuf.c_str()) + 1, NULL)) == SOCKET_ERROR)
				throw SetErrorMsgText("send: ", WSAGetLastError());
			if ((libuf = recv(cC, ibuf, sizeof(ibuf), NULL)) == SOCKET_ERROR)
				throw SetErrorMsgText("recv: ", WSAGetLastError());
			cout << ibuf << endl;
		}
		string obuf = "";
		if ((lobuf = send(cC, obuf.c_str(), strlen(obuf.c_str()) + 1, NULL)) == SOCKET_ERROR)
			throw SetErrorMsgText("send: ", WSAGetLastError());
		stop = clock();
		cout << "Time for send and recv: " << (double)((stop - start) / CLK_TCK) << endl;

		if (closesocket(cC) == SOCKET_ERROR)
			throw SetErrorMsgText("closesocket: ", WSAGetLastError());

		if (WSACleanup() == SOCKET_ERROR)
			throw SetErrorMsgText("Cleanup: ", WSAGetLastError());
	}
	catch (string errorMsgText)
	{
		cout << endl << errorMsgText << endl;
	}
	system("pause");
	return 0;
}