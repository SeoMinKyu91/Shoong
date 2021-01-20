# Shoong
Kosmo 7기 슝 프로젝트팀 입니다.
    _edit by suggom_

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
> * ex)<Context docBase="D:\JB\Workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp5\wtpwebapps\Shoong\upload" path="/fileupload" relodabl="true"/>
> * 리얼패쓰/upload가 없으면 서버 실행 도중 에러생성됨
> 7. db 계정 생성 후 /Shoong/src/main/resources/com/kosmo/shoong/erm에 KosmoProj.sql 실행 테이블 생성
> 8. /Shoong/src/main/resources/com/kosmo/shoong/pack/mybatis/packinsert.sql 실행
> 9. /Shoong/src/main/resources/com/kosmo/shoong/mypage/mybatis/mypageinsert.sql 실행
 
