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
	SOCKET sS; //���������� ������

	SOCKADDR_IN serv; //��������� ������ sS
	serv.sin_family = AF_INET; //������������ IP-���������
	serv.sin_port = htons(2000); //���� 2000
	serv.sin_addr.s_addr = INADDR_ANY; //����� ����������� IP-�����

	SOCKET cS; //����� ��� ������ ������� � ��������
	SOCKADDR_IN clnt; //��������� ������ �������
	memset(&clnt, 0, sizeof(clnt)); //�������� ������
	int lclnt = sizeof(clnt); //������ SOCKADDR_IN

	char ibuf[50]; //����� �����
	int libuf = 0; //���������� �������� ����
	int lobuf = 0; //���������� ������������ ����

	clock_t start, stop;
	try
	{
		if (WSAStartup(MAKEWORD(2, 0), &wsaData) != 0)
			throw SetErrorMsgText("Startup: ", WSAGetLastError());

		if ((sS = socket(AF_INET, SOCK_DGRAM, NULL)) == INVALID_SOCKET)
			throw SetErrorMsgText("socket: ", WSAGetLastError());

		if (bind(sS, (LPSOCKADDR)&serv, sizeof(serv)) == SOCKET_ERROR)
			throw SetErrorMsgText("bind: ", WSAGetLastError());

		do 
		{

		cout << "IP-address: " << inet_ntoa(clnt.sin_addr) << endl;

		start = clock();
		while (true)
		{
			if ((libuf = recvfrom(sS, ibuf, sizeof(ibuf), NULL, (sockaddr*)&clnt, &lclnt)) == SOCKET_ERROR)
				throw SetErrorMsgText("recvfrom: ", WSAGetLastError());
			Sleep(10);
			if ((lobuf = sendto(sS, ibuf, strlen(ibuf) + 1, NULL, (sockaddr*)&clnt, sizeof(clnt))) == SOCKET_ERROR)
				throw SetErrorMsgText("sendto: ", WSAGetLastError());
			if (strcmp(ibuf, "") == 0)
				break;
			cout << ibuf << endl;
		}
		stop = clock();
		cout << "Time for sendto and recvfrom: " << (double)((stop - start) / CLK_TCK) << endl;
		} while (true);

		if (closesocket(sS) == SOCKET_ERROR)
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