/*���̺� �����̽� ����� ����(syntax)
create tablespace ���̺� �����̽� �̸�
                 datafile'������ ���ϰ��'
                 size �ʱ������
                 autoextend on next �ڵ�����������
                  maxsize �ִ������;
*/

create tablespace madang
datafile 'D:\honggildong\madang.dbf'
size 50M
autoextend on next 10M
maxsize unlimited;

--���̺� �����̽� �����ϱ�
drop tablespace madang;

--���̺� �����̽� �ٽ� ����� *****���⼭ ������ �߸� ���� ����� ������ ã�ư��� �������� ������ ������ �����Ű�� �ȴ�.
create tablespace madang
datafile 'D:\honggildong\madang.dbf'
size 50M
autoextend on next 10M
maxsize unlimited;

/*����� ���� �����
create user ���̵� identified by ��й�ȣ
default tablespace ���̺����̽��̸�;
*/

create user madang identified by madang
default tablespace madang;

/*���� �ο��ϱ�
grant ���� to ���̵�;
����,
connect : �α��� ����
resource : �ڿ��� ����� �� �ִ� ����
dba : db������ ����
*/

grant connect, resource, dba to madang;
