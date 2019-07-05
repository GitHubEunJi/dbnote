/*테이블 스페이스 만들기 구문(syntax)
create tablespace 테이블 스페이스 이름
                 datafile'데이터 파일경로'
                 size 초기사이즈
                 autoextend on next 자동증가사이즈
                  maxsize 최대사이즈;
*/

create tablespace madang
datafile 'D:\honggildong\madang.dbf'
size 50M
autoextend on next 10M
maxsize unlimited;

--테이블 스페이스 삭제하기
drop tablespace madang;

--테이블 스페이스 다시 만들기 *****여기서 오류가 뜨면 직접 저장된 파일을 찾아가서 물리적인 파일을 삭제후 실행시키면 된다.
create tablespace madang
datafile 'D:\honggildong\madang.dbf'
size 50M
autoextend on next 10M
maxsize unlimited;

/*사용자 계정 만들기
create user 아이디 identified by 비밀번호
default tablespace 테이블스페이스이름;
*/

create user madang identified by madang
default tablespace madang;

/*권한 부여하기
grant 권한 to 아이디;
참고,
connect : 로그인 권한
resource : 자원을 사용할 수 있는 권한
dba : db관리자 권한
*/

grant connect, resource, dba to madang;
