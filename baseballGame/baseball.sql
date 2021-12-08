 --����--

CREATE TABLE users (
    userid    VARCHAR2(20) PRIMARY KEY,
    password  VARCHAR2(40) NOT NULL
);
 

 
 --ĳ����-

CREATE TABLE usercharacter (
    characterid    NUMBER PRIMARY KEY,
    userid         VARCHAR2(20) NOT NULL,
    charactername  VARCHAR2(40) NOT NULL,
    active         NUMBER(1) DEFAULT 5 NOT NULL,
    gold           NUMBER(5) DEFAULT 0 NOT NULL,
    health         NUMBER(3) DEFAULT 100 NOT NULL,
    year           NUMBER(2) DEFAULT 1 NOT NULL,
    classname            VARCHAR2(10) NOT NULL,
    hitterpower          NUMBER(3) DEFAULT 0,
    hitterhit            NUMBER(3) DEFAULT 0,
    hitterrunspeed       NUMBER(3) DEFAULT 0,
    pitcherballspeed     NUMBER(3) DEFAULT 0,
    pitcherballcontrol  NUMBER(3) DEFAULT 0,
    pitchermentality     NUMBER(3) DEFAULT 0,
    CONSTRAINT usercharacterfk FOREIGN KEY ( userid )
        REFERENCES users ( userid )
            ON DELETE CASCADE
);
 
 --�����ۼ�������--

CREATE TABLE itemhaveinfo (
    characterid  NUMBER,
    itemid       NUMBER,
    quantity     NUMBER,

    CONSTRAINT itemhaveinfofk1 FOREIGN KEY ( characterid )
        REFERENCES usercharacter ( characterid )
            ON DELETE CASCADE,
    CONSTRAINT itemhaveinfofk2 FOREIGN KEY ( itemid )
        REFERENCES item ( itemid )
            ON DELETE CASCADE
);



 
 --����

 select uc.charactername, i.itemname, ihi.quantity from usercharacter uc, itemhaveinfo ihi, item i
 where uc.characterid=ihi.characterid and i.itemid=ihi.itemid;
 
 select ihi.characterid, ihi.itemid, ihi.quantity from item i, itemhaveinfo ihi
where i.itemid = ihi.itemid;
 
 --��������������--

CREATE TABLE itemequipinfo (
    characterid   NUMBER PRIMARY KEY,
    equipitemid1  NUMBER DEFAULT 0 NOT NULL,
    equipitemid2  NUMBER DEFAULT 0 NOT NULL,
    equipitemid3  NUMBER DEFAULT 0 NOT NULL,
    CONSTRAINT itemequipinfofk1 FOREIGN KEY ( equipitemid1 )
        REFERENCES item ( itemid )
            ON DELETE CASCADE,
    CONSTRAINT itemequipinfofk2 FOREIGN KEY ( equipitemid2 )
        REFERENCES item ( itemid )
            ON DELETE CASCADE,
    CONSTRAINT itemequipinfofk3 FOREIGN KEY ( equipitemid3 )
        REFERENCES item ( itemid )
            ON DELETE CASCADE
);

 
 --������--

CREATE TABLE item (
    itemid       NUMBER PRIMARY KEY,
    itemclass    VARCHAR2(20) NOT NULL,
    itemname     VARCHAR2(40) NOT NULL,
    summary      VARCHAR2(100) NOT NULL,
    price        NUMBER NOT NULL
);



 
 --Ʈ���̴�--

CREATE TABLE training (
    trainingid     NUMBER PRIMARY KEY,
    trainingname   VARCHAR2(20) NOT NULL,
    trainingclass  VARCHAR2(20) NOT NULL
);

--Ʈ���̴�����

CREATE TABLE traininginfo (
    coachid     NUMBER,
    trainingid  NUMBER,
    CONSTRAINT traininginfo PRIMARY KEY ( coachid,
                                          trainingid ),
    CONSTRAINT traininginfofk1 FOREIGN KEY ( trainingid )
        REFERENCES training ( trainingid )
            ON DELETE CASCADE,
    CONSTRAINT traininginfofk2 FOREIGN KEY ( coachid )
        REFERENCES coach ( coachid )
            ON DELETE CASCADE
);

--��ġ--

CREATE TABLE coach (
    coachid        NUMBER PRIMARY KEY,
    coachname      VARCHAR2(20) NOT NULL,
    coacheffect1   NUMBER NOT NULL,
    coacheffect2   NUMBER DEFAULT 0,
    coachdecrease  NUMBER NOT NULL
);

--������ ����--

CREATE TABLE hallofframe (
    hallofframeid  NUMBER PRIMARY KEY,
    userid         VARCHAR2(20) NOT NULL,
    charactername  VARCHAR2(40) NOT NULL,
    allstat        NUMBER NOT NULL,
    classname      VARCHAR2(10) NOT NULL,
    CONSTRAINT hallofframefk FOREIGN KEY ( userid )
        REFERENCES users ( userid )
            ON DELETE CASCADE
);


--�������� ���� ���� --
CREATE TABLE itemequiphaveinfo (
    characterid  NUMBER NOT NULL,
    itemid       NUMBER NOT NULL,
    CONSTRAINT itemequiphaveinfofk1 FOREIGN KEY ( characterid )
        REFERENCES usercharacter ( characterid )
            ON DELETE CASCADE,
    CONSTRAINT itemequiphaveinfofk2 FOREIGN KEY ( itemid )
        REFERENCES item ( itemid )
            ON DELETE CASCADE
);


--������ ��ȭ--

CREATE TABLE itemlevel (
    itemid       NUMBER,
    itemlevel    NUMBER,
    itemeffect1  NUMBER NOT NULL,
    itemeffect2  NUMBER DEFAULT 0 NOT NULL,
    CONSTRAINT itemlevelfk1 PRIMARY KEY ( itemid,
                                       itemlevel ),
    CONSTRAINT itemlevelfk2 FOREIGN KEY ( itemid )
        REFERENCES item ( itemid )
            ON DELETE CASCADE
);


--�ذ� ĳ���� --
CREATE TABLE kickcharacter (
    kickcharacterid  NUMBER PRIMARY KEY,
    userid           VARCHAR2(20) NOT NULL,
    charactername    VARCHAR2(40) NOT NULL,
    allstat          NUMBER default 0 NOT NULL,
    CONSTRAINT kickcharacterfk FOREIGN KEY ( userid )
        REFERENCES users ( userid )
            ON DELETE CASCADE
);






<<<<<<< HEAD

insert into item(itemid,itemclass,itemname,summary,price) values(itemidseq.nextval,'�۷���','������ �۷���','����+3',300);
insert into item(itemid,itemclass,itemname,summary,price) values(itemidseq.nextval,'�۷���','������ �۷���','����+5',550);
insert into item(itemid,itemclass,itemname,summary,price) values(itemidseq.nextval,'�۷���','�¸��� �۷���','����+7',750);
----------------------------------------
insert into item(itemid,itemclass,itemname,summary,price) values(itemidseq.nextval,'��','������ ������','��Ż+3',300);
insert into item(itemid,itemclass,itemname,summary,price) values(itemidseq.nextval,'��','������ ������','��Ż+5',450);
insert into item(itemid,itemclass,itemname,summary,price) values(itemidseq.nextval,'��','�¸��� ������','��Ż+7',600);
----------------------------------------
insert into item(itemid,itemclass,itemname,summary,price) values(itemidseq.nextval,'���','������ ���','ü��+3',200);
insert into item(itemid,itemclass,itemname,summary,price) values(itemidseq.nextval,'���','������ ���','ü��+5',450);
insert into item(itemid,itemclass,itemname,summary,price) values(itemidseq.nextval,'���','�¸��� ���','ü��+7',650);
----------------------------------------
insert into item(itemid,itemclass,itemname,summary,price) values(itemidseq.nextval,'�����','������ �����','�Ŀ�+3',600);
insert into item(itemid,itemclass,itemname,summary,price) values(itemidseq.nextval,'�����','������ �����','�Ŀ�+5',900);
insert into item(itemid,itemclass,itemname,summary,price) values(itemidseq.nextval,'�����','�¸��� �����','�Ŀ�+7',1200);
----------------------------------------
insert into item(itemid,itemclass,itemname,summary,price) values(itemidseq.nextval,'�Ź�','������ �Ź�','���ǵ�+3',300);
insert into item(itemid,itemclass,itemname,summary,price) values(itemidseq.nextval,'�Ź�','������ �Ź�','���ǵ�+5',400);
insert into item(itemid,itemclass,itemname,summary,price) values(itemidseq.nextval,'�Ź�','�¸��� �Ź�','���ǵ�+7',500);
-----------------------------------------------------------
insert into item(itemid,itemclass,itemname,summary,price) values(itemidseq.nextval,'�Һ��� ������','��Ű','���ǵ� -5~+3 ����',300);
insert into item(itemid,itemclass,itemname,summary,price) values(itemidseq.nextval,'�Һ��� ������','����� ��Ű','���ǵ� 0~5 ����',500);
insert into item(itemid,itemclass,itemname,summary,price) values(itemidseq.nextval,'�Һ��� ������','��Ű','���ǵ� -5~+3 ����',300);
insert into item(itemid,itemclass,itemname,summary,price) values(itemidseq.nextval,'�Һ��� ������','��Ű','���ǵ� -5~+3 ����',300);
insert into itemequiphaveinfo(characterid,itemid) values(3,'104');
update item set summary='���ǵ� -5 ~ +5 ����' where itemname='��Ű'
delete item where itemname='��Ű';
select * from item;
select * from usercharacter;
select * from itemequiphaveinfo;
select * from itemequipinfo;
--���� ������ ���� ����
select * from itemhaveinfo;

commit;

select i.itemname, i.price, i.summary, count(ihi.quantity) as quantity, ihi.itemid
from item i, itemhaveinfo ihi, usercharacter uc
where i.itemid=ihi.itemid and ihi.characterid=uc.characterid 
group by i.itemname, i.price, i.summary, ihi.itemid; 


commit;


--sequence-

CREATE SEQUENCE characteridseq INCREMENT BY 1 MINVALUE 1;

CREATE SEQUENCE itemidseq INCREMENT BY 1 MINVALUE 101;

--CREATE SEQUENCE trainingidseq INCREMENT BY 1 MINVALUE 201;

--CREATE SEQUENCE itemequiphaveidseq INCREMENT BY 1 MINVALUE 201;

CREATE SEQUENCE trainingidseq INCREMENT BY 1 MINVALUE 301;

CREATE SEQUENCE coachidseq INCREMENT BY 1 MINVALUE 401;

CREATE SEQUENCE itemequiphaveseq INCREMENT BY 1 MINVALUE 501;

CREATE SEQUENCE itemequipidseq INCREMENT BY 1 MINVALUE 601;

CREATE SEQUENCE hallofframeidseq INCREMENT BY 1 MINVALUE 701;

CREATE SEQUENCE kickcharacteridseq INCREMENT BY 1 MINVALUE 801;

CREATE SEQUENCE quizseq INCREMENT BY 1 MINVALUE 1001;

CREATE SEQUENCE quizscoreseq INCREMENT BY 1 MINVALUE 1101;


--�Ʒ� ���� insert--
insert into training values ( trainingidseq.nextval, '�Ŀ��Ʒ�', 'Ÿ��');
insert into training values ( trainingidseq.nextval, 'Ÿ���Ʒ�', 'Ÿ��');
insert into training values ( trainingidseq.nextval, '�ַ��Ʒ�', 'Ÿ��');
insert into training values ( trainingidseq.nextval, '�����ǵ��Ʒ�', '����');
insert into training values ( trainingidseq.nextval, '����Ʈ���Ʒ�', '����');
insert into training values ( trainingidseq.nextval, '���ŷ��Ʒ�', '����');
--��ġ insert--
insert into coach (coachid, coachname, coacheffect1, coachdecrease) values (coachidseq.nextval, '�����Ʒ���ġ', 5, -25);
insert into coach (coachid, coachname, coacheffect1, coachdecrease) values (coachidseq.nextval, '�����Ʒ���ġ', 0, -25);
--�Ʒ� ���� insert --
insert into traininginfo values ( 401, 301 ); 
insert into traininginfo values ( 402, 301 ); 
insert into traininginfo values ( 401, 302 ); 
insert into traininginfo values ( 402, 302 ); 
insert into traininginfo values ( 401, 303 ); 
insert into traininginfo values ( 402, 303 ); 
insert into traininginfo values ( 401, 304 ); 
insert into traininginfo values ( 402, 304 ); 
insert into traininginfo values ( 401, 305 ); 
insert into traininginfo values ( 402, 305 ); 
insert into traininginfo values ( 401, 306 ); 
insert into traininginfo values ( 402, 306 ); 



--���� ����--
CREATE TABLE quiz (
    quiznumber  NUMBER PRIMARY KEY,
    question    VARCHAR2(300) NOT NULL,
    example1    VARCHAR2(60),
    example2    VARCHAR2(60),
    example3    VARCHAR2(60),
    example4    VARCHAR2(60),
    correct     VARCHAR2(60) NOT NULL
);



--������� ���� �����--

CREATE TABLE quizscore (
    quizscorenumber  NUMBER PRIMARY KEY,
    userid           VARCHAR2(20) NOT NULL,
    characterid      NUMBER NOT NULL,
    charactername    VARCHAR2(40) NOT NULL,
    correctanswer    NUMBER NOT NULL,
    wronganswer      NUMBER NOT NULL,
    correctpercent   NUMBER NOT NULL,
    CONSTRAINT quizscorefk1 FOREIGN KEY ( userid )
        REFERENCES users ( userid )
            ON DELETE CASCADE,
    CONSTRAINT quizscorefk2 FOREIGN KEY ( characterid )
        REFERENCES usercharacter ( characterid )
            ON DELETE CASCADE
);

insert
    INTO quiz values (
    quizseq.NEXTVAL,
    'KBO���� ���� ���ʷ�, 16�� ���� 10Ȩ���� ����� ������?',
    '������', 
    '�ڰ��', 
    '������', 
    '����', 
    '����'
    );
insert 
    INTO quiz values (
    quizseq.nextval, 
    '�Ｚ���̿��� �ҵ鿡�� �Ｚ������� �Ҹ��� ���Խ���, �ѱ��ø��� 4�⿬�� ��� �޼��⵵�� �����ϱ��?', 
    '1986����� 1989��',
    '1997����� 2000��',
    '2004����� 2007��',
    '2011����� 2014��',
    '2011����� 2014��'
    );
insert
    INTO quiz (quiznumber, question, correct) values (
    quizseq.NEXTVAL,
    '�߱� �����ǿ��� RHEB�� H�� �ǹ��ϴ� �ٴ�?',
    '��Ÿ'
    );
insert
    INTO quiz values (
    quizseq.NEXTVAL,
    '2021�� ù �������ӿ��� �ұ��ϰ�, 4�� 7��, 3�̴׵��� ����Ʈ ��Ī�� �����ָ� ������ �¸��� �Ÿ��� ����� ����������?',
    '���翵',
    '������',
    '���Ǹ�',
    '�̽���',
    '�̽���'
    );
insert
    INTO quiz values (
    quizseq.NEXTVAL,
    '������ ������� ��Ͽ���̴�. ���ڰ� �������� ���� ������� ���ϴ� ��� ����?',
    'ERA(�����)',
    'K/9(9�̴״� Ż������)',
    '�·�',
    'WAR(��ü������� �⿩�¼�)',
    'ERA(�����)'
    );
insert
    INTO quiz (quiznumber, question, correct) values (
    quizseq.NEXTVAL,
    'KBO������ ���Խ��𿡼��� ���� ������ ���� 3�� ���Ӱ�⸦ ������ �Ǵµ�, �� 3���� �� 3���� ��� �¸��� ��� ���� ����?',
    '����'
    );
insert
    INTO quiz (quiznumber, question, correct) values (
    quizseq.NEXTVAL,
    '21���� KBO �ý�Ÿ���� ���ֵǴ� ���� ����ϱ��?',
    '��ô'
    );
insert
    INTO quiz values (
    quizseq.NEXTVAL,
    '������ KBO���� ��, �������� �ٸ� ������ ����ϱ��?',
    '�λ� ���',
    'LG Ʈ����',
    'KT ����',
    'Ű�� �������',
    'KT ����'
    );
insert
    INTO quiz (quiznumber, question, correct) values (
    quizseq.NEXTVAL,
    '2021�� 6�� 4��, ��� 300��° ���縦 �޼��� �Ｚ���̿����� ���ع� ������ �����, KBO���� ���� �� ��° ����̾������?(���ڸ� ��������.)',
    '12'
    );
insert
    INTO quiz values (
    quizseq.NEXTVAL,
    '2021 �������� SOL KBO ���� 5�� MVP�� ������ ������?',
    '����(SSG)',
    '��Թ�(�Ｚ)',
    '����ȣ(KT)',
    '������(Ű��)',
    '������(Ű��)'
    );
insert
    INTO quiz values (
    quizseq.NEXTVAL,
    'KBO���� 2021����, �ι�° �Ϻ����� �޼��� ������?',
    '���̺�� ��ĳ��(�Ｚ ���̿���)',
    '�ַ� ��轺(��� Ÿ�̰���)',
    '��ä��(�Ｚ ���̿���)',
    '�ڼ���(�Ե� ���̾���)',
    '�ڼ���(�Ե� ���̾���)'
    );
insert
    INTO quiz values (
    quizseq.NEXTVAL,
    '2021�� 6�� 6��, KBO���� �߱� ��� �� �������� ���̳��� ���� ����?',
    '�Ե�-KT',
    'SSG-�λ�',
    '�Ｚ-Ű��',
    '��ȭ-NC',
    'SSG-�λ�'
    );
insert
    INTO quiz values (
    quizseq.NEXTVAL,
    'KBO �߱����� �� 1982�⿡ �¾�� ���� ������?',
    '�߽ż�(SSG ������)',
    '�̼���(LG Ʈ����)',
    '����ȯ(�Ｚ ���̿���)',
    '�̴�ȣ(�Ե� ���̾���)',
    '�̼���(LG Ʈ����)'
    );
insert
    INTO quiz values (
    quizseq.NEXTVAL,
    '2021�� 5�� 27��, NC ���̳뽺�� ������ ������ ���� 10��° Ȩ���� ����߽��ϴ�. ������ ������ �� ����� ���� ���� ��� �� �ڸ��� Ȩ���� ����������?',
    '8��',
    '9��',
    '10��',
    '11��',
    '8��'
    );
insert
    INTO quiz values (
    quizseq.NEXTVAL,
    'KBO���� 2022��(2023�� �Դ�)���� �����ϴ� ���ξ߱� �󸮵巡��Ʈ ������, ���б� ���г���� KBO ���ε巡��Ʈ�� ������ �� �������?',
    '1�г�',
    '2�г�',
    '3�г�',
    '4�г�',
    '2�г�'
    );
insert
    INTO quiz values (
    quizseq.NEXTVAL,
    '�߱����� �߰߼��� ���ϴ� CF�� � �ܾ��� ���Ӹ��ϱ��?',
    'Cash Flow',
    'Commercial Film',
    'Center Fielder',
    'Center Foward',
    'Center Fielder'
    );
insert
    INTO quiz values (
    quizseq.NEXTVAL,
    '�߱����� ���ڰ� 3�翡 ���� ��, ������ �ϱ� ���� ��Ʈ�� ��� ������ �ǹ��ϴ� �߱� ����?',
    '�巡�׹�Ʈ',
    '�������Ʈ',
    '�����Ʈ',
    '�����Ʈ',
    '�������Ʈ'
    );
insert
    INTO quiz values (
    quizseq.NEXTVAL,
    '��ȭ �̱۽��� ���Ĺ�ǥ�� ���� 4��° ����������� ���±� ������ ���ȣ��?',
    '21��',
    '23��',
    '35��',
    '52��',
    '52��'
    );
insert
    INTO quiz (quiznumber, question, correct) values (
    quizseq.NEXTVAL,
    'KBO���� ���� ���ʷ�, 16�� ���� 10Ȩ���� ����� ������?',
    '����'
    );
insert
    INTO quiz values (
    quizseq.NEXTVAL,
    'KBO���׿� �ܱ��μ��� ����� ���� ���Ե� �⵵��?',
    '1988��',
    '1998��',
    '2008��',
    '2018��',
    '1998��'
    );
    
>>>>>>> refs/remotes/origin/jeonjungyu