CREATE LOGIN lntinfotech\10673563 FROM WINDOWS WITH DEFAULT_DATABASE= master
GO
ALTER SERVER ROLE [sysadmin] 
ADD MEMBER lntinfotech\10673563
GO