postOffice := Object clone
postOffice packageSender := method(call sender)
postOffice messageTarget := method(call target)
postOffice messageArgs := method(call message)

mailer := Object clone
mailer deliver := method(postOffice packageSender)

mailer deliver println
postOffice messageTarget println

postOffice messageArgs println
