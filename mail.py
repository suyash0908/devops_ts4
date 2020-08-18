#!/bin/bash/python3
import smtplib

s=smtplib.SMTP('smtp.gmail.com',587)

s.starttls()

s.login("thakur2suyash@gmail.com","3179724774937007")

subject1='Important'


message1 = "your latest code ha been failed, please debug it as soon as possible."

s.sendmail("thakur2suyash@gmail.com","1706277@kiit.ac.in",message1)

s.quit()
