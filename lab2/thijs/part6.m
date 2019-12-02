line1 = "We offer our dear customers a wide selection of classy watches."
[nom_spam1, nom_notspam1] = classify_spam(line1)
ratio1 = nom_spam1/nom_notspam1

line2 = "Did you have fun on vacation? I sure did!"
[nom_spam2, nom_notspam2] = classify_spam(line2)
ratio2 = nom_spam2/nom_notspam2
