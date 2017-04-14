#----------------- HIST(������׷�) -----------------#

HealthSys <- read.delim("~/Rpractive/HealthSys.txt", comment.char="#")
View(HealthSys)

GDP <- read.delim("~/Rpractive/GDP.txt")
View(GDP)

hist(GDP$GDPperCapita2012, xlab="US $ (2012)", main="GDP / Capita",br=25,col="darkorange",density = 30)#br=������ �������ش�.

hist(HealthSys$PublicHealthExpensePercTotal, xlab="% of Total", main="Public Health Expense",br=25, col="purple",density = 30,angle=120)
# http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf R ���� ����

hist(GDP$GDPperCapita2012, xlab="US $ (2012)", main="GDP / Capita",br=25,col="darkorange",density = 30, freq=F)
#freq=F -> y���� �е��� ��Ÿ�� freq=T�̸� ��
lines(density(GDP$GDPperCapita2012, na.rm=T),lwd=2) #�߼����׸���,lwd �� ����

hist(HealthSys$PublicHealthExpensePercTotal, xlab="% of Total", main="Public Health Expense",br=25, col="darkorange",freq=F)
lines(density(HealthSys$PublicHealthExpensePercTotal,na.rm=T),col="purple",lwd=2,lty=2)#lty �����

kor <- which(GDP$CountryCode =="KOR")
hist(GDP$GDPperCapita2012,xlab = "US $ (2012)",main = "GDP / Capita", br=25,density = 30,freq=F)
abline(v=GDP$GDPperCapita2012[kor],col="red")
#abline(..) �Լ��� ���� y = a + b * x ������ �׸���� ���̴�.
#abline(v=..)�̸� ������, abline(h=..)�̷��� �ϸ� ������ �׷�����.

hist(HealthSys$PublicHealthExpensePercTotal,xlab="% of Total", main="Public Health Expese", br=25, col = "Orange" ,density = 30, freq=F)
abline(v=HealthSys$PublicHealthExpensePercTotal[kor], col="Yellow")

#----------------- BOXPLOT(�ڽ��׸�) -----------------#
#2012�� ���δ�GDP�� OECD�� OTHER �� ���� ������ ��

gdp.oecd <- GDP$GDPperCapita2012[GDP$OECD =="Y"]
gdp.other <- GDP$GDPperCapita2012[GDP$OECD !="Y"]
boxplot(list(gdp.oecd,gdp.other)) ## boxplot(..)�� �׻� list(..)�� �޽��ϴ�!

#�� �ڽ��� �̸� �ֱ�
gdplist <- list("OECD"=gdp.oecd,"OTHER"=gdp.other)
boxplot(gdplist)

#x��, y��, main�� ������ ���� ���� boxplot�Լ� �ȿ��� �۾��� �ؾ��Ѵ�.
boxplot(gdplist, main="GDP / Capita", xlab="Country Group", ylab="US $ (2012)")

#�ɺ����(pch), ũ��(cex), ��(bg) �����ϱ�
boxplot(gdplist, main="GDP / Capita", xlab="Country Group", ylab="US $ (2012)", pch=17, cex=1.5, bg="darkblue", col="beige")

#�׸� �������� �������� �ٲٱ�(horizontal=T)
boxplot(gdplist, main="GDP / Capita", ylab="Country Group", xlab="US $ (2012)", pch=17, cex=1.5, bg="darkblue", col="beige", horizontal=T)

#�׷� �� �׸����� �ѱ���??
boxplot(gdplist, main="GDP / Capita", xlab="Group", ylab="US $ (2012)", pch=17, cex=1.5, bg="darkblue", col="beige")
abline(h=GDP$GDPperCapita2012[kor], col="red", lty=2)

#----------------- PLOT(������ ����.picture.R�� 1������ �ֽ��ϴ�.) -----------------#
plot(GDP$GDPperCapita2012, HealthSys$PublicHealthExpensePercTotal)

plot(GDP$GDPperCapita2012, HealthSys$PublicHealthExpensePercTotal, main="GDP vs Public Health
Portion", xlab="GDP / Capita (US $, 2012)", ylab="Public
Health Portion (%)", pch=21, bg="darkblue", col="lightblue")

#�ѱ��� ��ġ ǥ���غ���
plot(GDP$GDPperCapita2012, HealthSys$PublicHealthExpensePercTotal, main="GDP vs Public Health
Portion", xlab="GDP / Capita (US $, 2012)", ylab="Public
Health Portion (%)", pch=21, bg="darkblue", col="lightblue")

points(GDP$GDPperCapita2012[kor], HealthSys$PublicHealthExpensePercTotal[kor], pch=21, bg="darkorange", col="Yellow")
abline(v=GDP$GDPperCapita2012[kor], col="orange", lty=2)
abline(h=HealthSys$PublicHealthExpensePercTotal[kor], col="orange", lty=2)

#OECD ���� ǥ��
oecd <- which(GDP$OECD == "Y")
points(GDP$GDPperCapita2012[oecd], HealthSys$PublicHealthExpensePercTotal[oecd], pch=21, bg="darkred", col="pink")

#���� ǥ�� (/legend(<��ġ>, legend=<������ ������>, <��Ÿ �׸� ���� �Է� ����>)/)
legend("bottomright", legend=c("OECD", "Korea"),
pch=c(21,8), col=c("pink", "yellow"), pt.bg=c("darkred", "darkorange"),bg="blue")

#<��ġ> Ex = "topleft"
#���� ������ c(..)�Լ��� �̿��Ѵ�. c()�Լ��� ���� ���� ���� ���Ͱ��� ������ִ� �Լ���.
#bg="blue"�� ����ϸ� ������ ��׶��带 �����ϱ� ������
#pt.bg�� ����ؾ� �ɹ��� ���� ���� ���Ѵ�.

#������ ����!
#plot()���� �ع��� �׸� �׸���, ������ ���̳� �ɺ� �������׸���
#lines()�� ���� ������� �Լ�
#points()�� �ɺ��� �������.
#abline()�� ���� ���� �׸���
#legend()�Լ��� ���ʸ� �׸��� ������