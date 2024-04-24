

##      "QRGen:  Transforming Links into Quick Response (QR) Codes"




# importing useful py library for this proj:   QRCODE, & TKINTER   
import qrcode as q
import tkinter as t

f = t.Tk()
f.geometry("500x300")
f.title('QR code generator')
f.resizable(width=0, height=0)
t.Label(f, text="Enter your url").place(x=30, y=50)
ta = t.Entry(f,width=50)
ta.place(x=140, y=50)



# defining funct
def qr():
    s=ta.get()
    if len(s)==0:
        l.config(text="Sorry, firstly you have to give url ")
    else:
        l.config(text="")
        qr=q.QRCode(
            version=5,
            box_size=10
        )
        qr.add_data(s)
        qr.make(fit=True)
        img= qr.make_image(fill_color='blue', back_color="white")


        #asking the name & purpose of generating qr code and then save img as user entered
        title_qrName = input("Enter the name of QR Code, which you want:")
        img.save(f"{title_qrName}.png")
        img.show()




# printing
t.Button(f, text="Generate QR Code", command=qr).place(x=120, y=100)
l= t.Label(f, text="", fg="red")
l.place(x=80, y=150)
f.mainloop()



