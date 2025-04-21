from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas
from openpyxl import Workbook

def generate_pdf_report(officers):
    c = canvas.Canvas("officer_report.pdf", pagesize=A4)
    width, height = A4
    c.setFont("Helvetica-Bold", 14)
    c.drawString(50, height - 50, "Officer Access Report")

    c.setFont("Helvetica", 12)
    y = height - 80
    for officer in officers:
        c.drawString(50, y, f"ID: {officer[0]}, Name: {officer[1]}, Badge: {officer[2]}")
        y -= 20
        if y < 50:
            c.showPage()
            c.setFont("Helvetica", 12)
            y = height - 50

    c.save()

def generate_excel_report(officers):
    wb = Workbook()
    ws = wb.active
    ws.title = "Officers"
    ws.append(["ID", "Name", "Badge Number"])

    for officer in officers:
        ws.append(officer)

    wb.save("officer_report.xlsx")