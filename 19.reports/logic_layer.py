import db_layer
import report_utils

def create_officer_logic(name, badge):
    return db_layer.add_officer(name, badge)

def read_officers_logic():
    return db_layer.get_all_officers()

def search_officer_logic(term):
    return db_layer.search_officers(term)

def update_officer_logic(officer_id, name, badge):
    db_layer.update_officer(officer_id, name, badge)

def delete_officer_logic(officer_id):
    db_layer.delete_officer(officer_id)

def generate_report_logic(report_type="pdf"):
    officers = db_layer.get_all_officers()
    if report_type == "pdf":
        report_utils.generate_pdf_report(officers)
    elif report_type == "xlsx":
        report_utils.generate_excel_report(officers)
