user테이블
create table users
(
user_id varchar2(20) constraint pk_user_id primary key,
user_pwd varchar2(1000) constraint nn_password not null,
user_salt varchar2(1000),
user_name varchar2(50),
user_img blob,
user_gen varchar2(20),
user_intro varchar2(1000))
/

board테이블
create table board(
board_num number constraint pk_board_boardnum primary key,
user_id varchar2(20) constraint fk_board_userid references users(user_id) on delete cascade,
board_img blob,
board_content varchar2(1000),
board_date date,
like_count number)
/

좋아요 테이블
create table likes(
user_id varchar2(20) constraint fk_like_userid references users(user_id) on delete cascade,
board_num number constraint fk_like_boardnum references board(board_num) on delete cascade)
/

팔로우테이블
create table follow(
send_id varchar2(20) constraint fk_follow_sendid references users(user_id) on delete cascade,
get_id varchar2(20) constraint fk_follow_getid references users(user_id) on delete cascade,
constraint pk_follow primary key(send_id,get_id))
)
/

댓글테이블
create table reply
(
reply_num number constraint pk_replynum primary key,
board_num number constraint fk_reply_boardnum references board(board_num) on delete cascade,
user_id varchar2(20) constraint fk_reply_userid references users(user_id) on delete cascade,
reply_content varchar2(1000))
/

채팅테이블
create table chat(
chat_sender varchar2(20) constraint fk_chat_sender references users(user_id) on delete cascade,
chat_receiver varchar2(20) constraint fk_chat_receiver references users(user_id) on delete cascade,
chat_content  varchar2(1000),
chat_date date default sysdate)
/


활동테이블
create table actlog
(
act_id varchar2(20) constraint fk_actlog_act references users(user_id) on delete cascade,
react_id varchar2(20) constraint fk_actlog_react references users(user_id) on delete cascade,
actlog_content varchar2(1000),
actlog_date date default sysdate)
/

create sequence board_seq;
create sequence reply_seq;