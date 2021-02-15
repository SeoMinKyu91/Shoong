# Shoong
Kosmo 7기 슝 프로젝트팀 입니다.
    _edit by 우경환_

> 사전 작업
> 1. Tomcat 9 사양의 서버를 생성한다
> 2. 해당 프로젝트의 타겟 런타임을 생성한 서버로 설정한다
> 3. 해당 프로젝트의 Facets은 pom.xml을 참고하여 설정한다
> 4. 생성한 서버의 server.xml의 <GlobalNamingResources> 태그에
> 아래 코드를 추가하고 글로벌네임과 비밀번호/아이디를 추가한다
> ```
> <Resource auth="Container" driverClassName="oracle.jdbc.driver.OracleDriver" 
> maxIdle="20" maxTotal="20" name="db 글로벌 네임" password="비밀 번호" 
> type="javax.sql.DataSource" url="jdbc:oracle:thin:@localhost:1521:orcl" 
> username="아이디"/>
> ```
> 5. 생성한 서버의 context.xml의 <Context> 태그에 아래 코드를 추가한다
> ```
> <ResourceLink global="글로벌네임"
>				name="글로벌네임"
>				type="javax.sql.DataSource"/> 
> ```
> 6. 생성한 서버의 server.xml의 <Host> 태그에 아래 코드를 추가한다
> ```
> <Context docBase="해당 서버의 realpath" 
> path="독베이스의 별칭 경로" relodabl="true"/>
> ```
> ```
> ex)<Context 
>     docBase="D:\JB\Workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp5\wtpwebapps\Shoong\upload" 
>     path="/fileupload" relodabl="true"/>
> ```
> * 리얼패쓰/upload가 없으면 서버 실행 도중 에러생성됨
> 7. db 계정 생성 후 /Shoong/src/main/resources/com/kosmo/shoong/erm에 0206KosmoProj.sql 실행하여 테이블을 생성 실행 테이블 생성
> 8. /Shoong/src/main/resources/com/kosmo/shoong/erm에 0215KosmoProjInsert.sql
> 9. 생성한 독 베이스 경로에 공유한 upload 폴더 추가
> 10. https://github.com/suggom/ShoongFlask 챗봇에 필요한 플라스크 서버와 앱 프로젝트
> 11. https://github.com/suggom/Shooong 경로 추적 서비스에 필요한 안드로이드 프로젝트
 
