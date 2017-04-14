library(readr)
keycode <- read.csv("~/Rproj/KeyCode.csv")
View(keycode)

# as.data.frame���� List Ÿ���� keycode�� data.frame���� ����ȯ
keycode <- as.data.frame(keycode)

# na.omit <- na�� ���� ��� �� ����
keycode <- na.omit(keycode)

# != ���ܽ��Ѷ�, NULL�� ���Ե� ��� ��. 
keycode <- keycode[keycode$click != '',]

 View(keycode)

# formattable ǥ �ۼ��� ���� ��Ű��
# https://renkun.me/formattable/
install.packages("formattable")
install.packages("rprojroot") # formattable ��ġ�� ���� �ʿ��� ��Ű��
library(formattable)

# data.frame���� �̷���� keycode �ۼ�
keycodes <- data.frame(
  keycode$Reference,
  keycode$click
)

# formattable ����
formattable(keycodes)