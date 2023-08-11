/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Drug;
import model.MedicalReport;
import model.Treatment;
import util.DateTimeHelper;

/**
 *
 * @author nguye
 */
public class MedicalReportDBContext extends DBContext<MedicalReport> {

    public Treatment getTreatment(int patient_id, int doctor_id, String timeString, int treatment_id) {
        try {
            String sql = "select detail from medical_report_treatment_detail \n"
                    + "where medical_report_patient_id = ?\n"
                    + "and medical_report_doctor_id = ?\n"
                    + "and medical_report_time = ?\n"
                    + "and treatment_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, patient_id);
            stm.setInt(2, doctor_id);
            stm.setString(3, timeString);
            stm.setInt(4, treatment_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Treatment treatment = new Treatment();
                treatment.setId(treatment_id);
                treatment.setDetail(rs.getString("detail"));
                return treatment;
            }
        } catch (SQLException e) {
            System.out.println("Cannot get treatment");
        }
        return null;
    }

    public void insertTreatment(int patient_id, int doctor_id, String timeString, int treatment_id, String detail, int price) {
        try {
            String sql = "INSERT INTO `swp391_project`.`medical_report_treatment_detail` (`medical_report_patient_id`, `medical_report_doctor_id`, `medical_report_time`, `treatment_id`, `detail`, `price`)"
                    + " VALUES (?, ?, ?, ?, ?, ?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, patient_id);
            stm.setInt(2, doctor_id);
            stm.setString(3, timeString);
            stm.setInt(4, treatment_id);
            stm.setString(5, detail);
            stm.setInt(6, price);
            System.out.println("Add treatment");
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Cannot add treatment");
        }
    }

    public void deleteTreatment(int patient_id, int doctor_id,
            String timeString, int treatment_id) {
        try {
            String sql = "DELETE FROM `swp391_project`.`medical_report_treatment_detail` "
                    + "WHERE (`medical_report_patient_id` = ?) "
                    + "and (`medical_report_doctor_id` = ?) "
                    + "and (`medical_report_time` = ?) "
                    + "and (`treatment_id` = ?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, patient_id);
            stm.setInt(2, doctor_id);
            stm.setString(3, timeString);
            stm.setInt(4, treatment_id);
            stm.executeUpdate();
            System.out.println("Delete!");
        } catch (SQLException e) {
            System.out.println("Cannot delete treatment (SQL)");
        }
    }

    public void updateTreatment(String detail,
            int patient_id, int doctor_id,
            String timeString, int treatment_id) {
        try {
            String sql = "UPDATE `swp391_project`.`medical_report_treatment_detail` \n"
                    + "SET  `detail` = ? \n"
                    + "WHERE (`medical_report_patient_id` = ?)\n"
                    + "and (`medical_report_doctor_id` = ?) \n"
                    + "and (`medical_report_time` = ?) \n"
                    + "and (`treatment_id` = ?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, detail);
            stm.setInt(2, patient_id);
            stm.setInt(3, doctor_id);
            stm.setString(4, timeString);
            stm.setInt(5, treatment_id);
            System.out.println("Update!");
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Cannot update treatment (SQL)");
        }
    }

    public ArrayList<Treatment> getListTreatment(int patient_id, int doctor_id, String timeString) {
        ArrayList<Treatment> treatments = new ArrayList<>();
        try {
            String sql = "SELECT t.name, t.id, mdt.detail, mdt.price FROM swp391_project.medical_report_treatment_detail mdt\n"
                    + "join treatment t on mdt.treatment_id = t.id \n"
                    + "where medical_report_doctor_id = ? and medical_report_patient_id = ? and medical_report_time = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, doctor_id);
            stm.setInt(2, patient_id);
            stm.setString(3, timeString);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Treatment t = new Treatment();
                t.setDetail(rs.getString("detail"));
                t.setPrice(rs.getInt("price"));
                t.setName(rs.getString("name"));
                t.setId(rs.getInt("id"));
                treatments.add(t);
            }
            return treatments;
        } catch (SQLException e) {
        }
        return null;
    }

    public void insertDrug(int patient_id, int doctor_id,
            String timeString, int drug_id,
            int amount, int price, String dosage) {
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO `swp391_project`.`medical_report_has_drug` "
                    + "(`patient_id`, `doctor_id`, `time`, `drug_id`, `amount`, `price`, `dosage`) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, patient_id);
            stm.setInt(2, doctor_id);
            stm.setString(3, timeString);
            stm.setInt(4, drug_id);
            stm.setInt(5, amount);
            stm.setInt(6, price);
            stm.setString(7, dosage);
            stm.executeUpdate();
            System.out.println("Add drug");

            String sqlUpdate = "UPDATE `swp391_project`.`drug`\n"
                    + "SET\n"
                    + "`quantity_in_stock` = `quantity_in_stock` - ? + ?\n"
                    + "WHERE `id` = ?";
            PreparedStatement stmUpdate = connection.prepareStatement(sqlUpdate);

            stmUpdate.setInt(1, amount);
            stmUpdate.setInt(2, amount);
            stmUpdate.setInt(3, drug_id);
            stmUpdate.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            try {
                System.out.println("Cannot insert drug");
                connection.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(MedicalReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    connection.setAutoCommit(true);
                } catch (SQLException ex) {
                    Logger.getLogger(MedicalReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }
    }

    public Drug getDrug(int patient_id, int doctor_id, String timeString, int drug_id) {
        try {
            String sql = "select patient_id, doctor_id, time, mdhd.drug_id, amount, mdhd.price,dosage, d.name\n"
                    + "from medical_report_has_drug mdhd\n"
                    + "join drug d on mdhd.drug_id = d.id\n"
                    + "where patient_id = ?\n"
                    + "and doctor_id = ?\n"
                    + "and time = ?"
                    + "and drug_id = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, patient_id);
            stm.setInt(2, doctor_id);
            stm.setString(3, timeString);
            stm.setInt(4, drug_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Drug drug = new Drug();
                drug.setId(drug_id);
                drug.setName(rs.getString("name"));
                drug.setPrice(rs.getInt("price"));
                drug.setDosage(rs.getString("dosage"));
                drug.setAmount(rs.getInt("amount"));
                return drug;
            }
        } catch (SQLException e) {
            System.out.println("Cannot get drug");
        }
        return null;
    }

    public ArrayList<Drug> getListDrug(int patient_id, int doctor_id, String timeString) {
        ArrayList<Drug> drugs = new ArrayList<>();
        try {
            String sql = "select patient_id, doctor_id, time, mdhd.drug_id, amount, mdhd.price,dosage, d.name\n"
                    + "from medical_report_has_drug mdhd\n"
                    + "join drug d on mdhd.drug_id = d.id\n"
                    + "where patient_id = ?\n"
                    + "and doctor_id = ?\n"
                    + "and time = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, patient_id);
            stm.setInt(2, doctor_id);
            stm.setString(3, timeString);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Drug drug = new Drug();
                drug.setId(rs.getInt("drug_id"));
                drug.setName(rs.getString("name"));
                drug.setPrice(rs.getInt("price"));
                drug.setDosage(rs.getString("dosage"));
                drug.setAmount(rs.getInt("amount"));
                drugs.add(drug);
            }
            return drugs;
        } catch (SQLException e) {
            System.out.println("Cannot get drug");
        }
        return null;
    }

    public void updateDrug(int patient_id, int doctor_id, String timeString, int drug_id,
            int new_amount, String new_dosage) {
        try {
            String sql = "UPDATE `swp391_project`.`medical_report_has_drug` SET "
                    + "`amount` = ?, `dosage` = ? "
                    + "WHERE (`patient_id` = ?) and (`doctor_id` = ?) "
                    + "and (`time` = ?) and (`drug_id` = ?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, new_amount);
            stm.setString(2, new_dosage);
            stm.setInt(3, patient_id);
            stm.setInt(4, doctor_id);
            stm.setString(5, timeString);
            stm.setInt(6, drug_id);
            stm.executeUpdate();
            System.out.println("Update!");
        } catch (SQLException e) {
            System.out.println("Cannot update drug");
        }
    }

    public void deleteDrug(int patient_id, int doctor_id, String timeString, int drug_id) {
        try {
            String sql = "DELETE FROM `swp391_project`.`medical_report_has_drug` "
                    + "WHERE (`patient_id` = ?) and (`doctor_id` = ?) and "
                    + "(`time` = ?) and (`drug_id` = ?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, patient_id);
            stm.setInt(2, doctor_id);
            stm.setString(3, timeString);
            stm.setInt(4, drug_id);
            stm.executeUpdate();
            System.out.println("Delete!");
        } catch (SQLException e) {
            System.out.println("Cannot delete drug");
        }
    }

    @Override
    public void insert(MedicalReport model) {
        try {
            String sql = "INSERT INTO `swp391_project`.`medical_report` (`pulse`, `bloodpressure`, `breathing`, `height`, `weight`, `symptom`, `result`, `time`, `patient_id`, `doctor_id`)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getPulse());
            stm.setInt(2, model.getBloodPress());
            stm.setInt(3, model.getBreathing());
            stm.setInt(4, model.getHeight());
            stm.setInt(5, model.getWeight());
            stm.setString(6, model.getSymptom());
            stm.setString(7, model.getResult());
            stm.setString(8, model.getTime().toString());
            stm.setInt(9, model.getPatient_id());
            stm.setInt(10, model.getDoctor_id());
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void insertOnlyPK(MedicalReport model) {
        try {
            String sql = "insert into medical_report (`time`, `patient_id`, `doctor_id`)"
                    + "values (?,?,?);";
            String timeString = DateTimeHelper.toDateTimeSql(model.getTime());
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, timeString);
            stm.setInt(2, model.getPatient_id());
            stm.setInt(3, model.getDoctor_id());
            stm.executeUpdate();
            System.out.println("insert only PK");
        } catch (SQLException e) {
            System.out.println("Can not insert only PK");
        }
    }

    public void updateByPK(MedicalReport model) {
        try {
            String sql = "UPDATE medical_report\n"
                    + "SET pulse = ?, bloodpressure = ?,\n"
                    + "breathing = ?, height = ?, weight = ?, \n"
                    + "symptom = ?, result = ?\n"
                    + "WHERE time = ? and patient_id = ? and doctor_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getPulse());
            stm.setInt(2, model.getBloodPress());
            stm.setInt(3, model.getBreathing());
            stm.setInt(4, model.getHeight());
            stm.setInt(5, model.getWeight());
            stm.setString(6, model.getSymptom());
            stm.setString(7, model.getResult());
            LocalDateTime time = model.getTime();
            String timeString = DateTimeHelper.toDateTimeSql(time);
            stm.setString(8, timeString);
            stm.setInt(9, model.getPatient_id());
            stm.setInt(10, model.getDoctor_id());
            stm.executeUpdate();
            System.out.println("Update by PK");
        } catch (SQLException e) {
            System.out.println("Can not update by PK");
        }
    }

    public MedicalReport getByPK(String timeString, int patient_id, int doctor_id) {
        try {
            String sql = "select * from medical_report \n"
                    + "where time=? and patient_id=? and doctor_id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, timeString);
            stm.setInt(2, patient_id);
            stm.setInt(3, doctor_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                MedicalReport medicalReport = new MedicalReport();
                medicalReport.setPulse(rs.getInt("pulse"));
                medicalReport.setBloodPress(rs.getInt("bloodpressure"));
                medicalReport.setBreathing(rs.getInt("breathing"));
                medicalReport.setDoctor_id(doctor_id);
                medicalReport.setHeight(rs.getInt("height"));
                medicalReport.setWeight(rs.getInt("weight"));
                medicalReport.setPatient_id(patient_id);
                medicalReport.setSymptom(rs.getString("symptom"));
                medicalReport.setResult(rs.getString("result"));
                medicalReport.setTime(DateTimeHelper.toLocalDateTime(timeString));
                return medicalReport;
            }
        } catch (SQLException e) {
            System.out.println("Can get medical report");
        }
        return null;
    }

    @Override
    public void update(MedicalReport model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(MedicalReport model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public MedicalReport get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<MedicalReport> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void addDrug(MedicalReport medicalReport, int drug_id) {
        try {
            String sql = "INSERT INTO `swp391_project`.`medical_report_has_drug` (`patient_id`, `doctor_id`,  `time`, `drug_id`)"
                    + " VALUES (?, ?, ?,?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, medicalReport.getPatient_id());
            stm.setInt(2, medicalReport.getDoctor_id());
            System.out.println(medicalReport.getTime().toString());
            stm.setString(3, medicalReport.getTime().toString());
            stm.setInt(4, drug_id);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Can not add drug ");
        }
    }

    public boolean isTreatmentInList(ArrayList<Treatment> treatments, int treatmentId) {
        for (Treatment t : treatments) {
            if (t.getId() == treatmentId) {
                return true;
            }
        }
        return false;
    }

    public boolean isDrugInList(ArrayList<Drug> drugs, int drugId) {
        for (Drug t : drugs) {
            if (t.getId() == drugId) {
                return true;
            }
        }
        return false;
    }

    public MedicalReport getFullMedicalReport(int patient_id, int doctor_id,
            String timeString) {
        try {
            String sql = "select md.patient_id, md.doctor_id, md.time,\n"
                    + "md.bloodpressure, md.breathing, md.height, md.weight, md.pulse,\n"
                    + "md.symptom, md.result,\n"
                    + "mdht.treatment_id, mdhd.drug_id,\n"
                    + "t.name as treatment_name, d.name as drug_name,\n"
                    + "mdht.detail,mdht.price as treatment_price,\n"
                    + "mdhd.price as drug_price, mdhd.amount, mdhd.dosage,\n"
                    + "u.name as patient_name, u.address, u.dob, u.avatarUrl, u.phone, u.gender\n"
                    + "from medical_report_treatment_detail mdht\n"
                    + "right join \n"
                    + "medical_report md on \n"
                    + "(mdht.medical_report_patient_id = md.patient_id \n"
                    + "and mdht.medical_report_doctor_id = md.doctor_id\n"
                    + "and mdht.medical_report_time = md.time)\n"
                    + "left join \n"
                    + "medical_report_has_drug mdhd on\n"
                    + "mdhd.patient_id = md.patient_id\n"
                    + "and mdhd.doctor_id = md.doctor_id\n"
                    + "and mdhd.time = md.time \n"
                    + "left join drug d on mdhd.drug_id = d.id\n"
                    + "left join treatment t on mdht.treatment_id = t.id\n"
                    + "left join user u on md.patient_id = u.id\n"
                    + "where md.patient_id = ? and md.doctor_id = ? \n"
                    + "and md.time = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, patient_id);
            stm.setInt(2, doctor_id);
            stm.setString(3, timeString);
            System.out.println("Get MR");
            ResultSet rs = stm.executeQuery();
            MedicalReport medicalReport = new MedicalReport();
            medicalReport.setPatient_id(-1);
            while (rs.next()) {
                if (medicalReport.getPatient_id() == -1) {
                    medicalReport.setPatient_id(rs.getInt("patient_id"));
                    medicalReport.setDoctor_id(rs.getInt("doctor_id"));
                    medicalReport.setTime(DateTimeHelper.toLocalDateTime(timeString));
                    medicalReport.setBloodPress(rs.getInt("bloodpressure"));
                    medicalReport.setBreathing(rs.getInt("breathing"));
                    medicalReport.setHeight(rs.getInt("height"));
//                    System.out.println(rs.getInt("weight"));
                    medicalReport.setWeight(rs.getInt("weight"));
//                    System.out.println("ok");
                    medicalReport.setPulse(rs.getInt("pulse"));
                    medicalReport.setSymptom(rs.getString("symptom"));
                    medicalReport.setResult(rs.getString("result"));
                }
                DrugDBContext ddb = new DrugDBContext();
                TreatmentDBContext tmdb = new TreatmentDBContext();

                int treatment_id = rs.getInt("treatment_id");
                int drug_id = rs.getInt("drug_id");
                if (!isTreatmentInList(medicalReport.getTreatments(), treatment_id)) {
                    Treatment treatment = new Treatment();
                    treatment.setId(treatment_id);
                    treatment.setName(rs.getString("treatment_name"));
                    treatment.setDetail(rs.getString("detail"));
                    treatment.setPrice(rs.getInt("treatment_price"));
                    medicalReport.getTreatments().add(treatment);
                }
                if (!isDrugInList(medicalReport.getDrugs(), drug_id)) {
                    Drug drug = new Drug();
                    drug.setId(drug_id);
                    drug.setName(rs.getString("drug_name"));
                    drug.setPrice(rs.getInt("drug_price"));
                    drug.setAmount(rs.getInt("amount"));
                    drug.setDosage(rs.getString("dosage"));
                    medicalReport.getDrugs().add(drug);
                }
            }
            return medicalReport;
        } catch (SQLException e) {
            System.out.println("Cannot get medical report");
        }
        return null;
    }

    public void updateIsPaid(int patient_id, int doctor_id,
            String timeString, int is_paid) {
        try {
            String sql = "UPDATE `swp391_project`.`medical_report` SET `is_paid` = b?"
                    + " WHERE (`patient_id` = ?) and (`doctor_id` = ?)"
                    + " and (`time` = ?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            if (is_paid == 1) {
                stm.setString(1, "1");
            } else {
                stm.setString(1, "0");
            }
            stm.setInt(2, patient_id);
            stm.setInt(3, doctor_id);
            stm.setString(4, timeString);
            stm.executeUpdate();
            System.out.println("Update is paid");
        } catch (SQLException e) {
            System.out.println("Can not update is paid");
        }
    }

    public ArrayList<MedicalReport> getNotPaidList() {
        ArrayList<MedicalReport> medicalReports = new ArrayList<>();
        try {
            String sql = "select time, patient_id, doctor_id from medical_report\n"
                    + "where is_paid = 0;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                MedicalReport medicalReport = new MedicalReport();
                medicalReport.setPatient_id(rs.getInt("patient_id"));
                medicalReport.setDoctor_id(rs.getInt("doctor_id"));
                medicalReport.setTime(DateTimeHelper.toLocalDateTime(rs.getString("time")));
                medicalReports.add(medicalReport);
            }
            return medicalReports;
        } catch (SQLException e) {
            System.out.println("Cannot get medical reports");
        }
        return null;
    }

    public ArrayList<MedicalReport> getPatientMedicalReports(int patient_id) {
        ArrayList<MedicalReport> medicalReports = new ArrayList<>();
        try {
            String sql = "select time, patient_id, doctor_id, is_paid, symptom, result from medical_report\n"
                    + "where patient_id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, patient_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                MedicalReport medicalReport = new MedicalReport();
                medicalReport.setPatient_id(patient_id);
                medicalReport.setDoctor_id(rs.getInt("doctor_id"));
                medicalReport.setTime(DateTimeHelper.toLocalDateTime(rs.getString("time")));
                medicalReport.setSymptom(rs.getString("symptom"));
                medicalReport.setResult(rs.getString("result"));
                medicalReport.setPaid(rs.getBoolean("is_paid"));
                medicalReports.add(medicalReport);
            }
            return medicalReports;
        } catch (SQLException e) {
            System.out.println("Cannot get my medical report list");
        }
        return null;
    }

    public ArrayList<MedicalReport> getMedicalReportsByPatientIdAndDoctorId(int patientId, int doctorId) {
        try {
            ArrayList<MedicalReport> patientDoctorMedicalReports = new ArrayList<>();
            String sql = "SELECT  time, patient_id, doctor_id, is_paid, symptom, result from medical_report\n"
                    + "where patient_id = ? and doctor_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, patientId);
            stm.setInt(2, doctorId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                MedicalReport medicalReport = new MedicalReport();
                medicalReport.setPatient_id(patientId);
                medicalReport.setDoctor_id(doctorId);
                medicalReport.setTime(DateTimeHelper.toLocalDateTime(rs.getString("time")));
                medicalReport.setSymptom(rs.getString("symptom"));
                medicalReport.setResult(rs.getString("result"));
                medicalReport.setPaid(rs.getBoolean("is_paid"));
                patientDoctorMedicalReports.add(medicalReport);
            }
            return patientDoctorMedicalReports;
        } catch (SQLException ex) {
            Logger.getLogger(MedicalReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<MedicalReport> getMedicalReportsByDate(int patientId, String from, String to) {
        try {
            ArrayList<MedicalReport> medicalReports = new ArrayList<>();
            String sql = "SELECT *FROM swp391_project.medical_report\n"
                    + "where patient_id = ? and DATE(time) between ? and ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, patientId);
            stm.setString(2, from);
            stm.setString(3, to);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                MedicalReport medicalReport = new MedicalReport();
                medicalReport.setPatient_id(patientId);
                medicalReport.setDoctor_id(rs.getInt("doctor_id"));
                medicalReport.setTime(DateTimeHelper.toLocalDateTime(rs.getString("time")));
                medicalReport.setSymptom(rs.getString("symptom"));
                medicalReport.setResult(rs.getString("result"));
                medicalReport.setPaid(rs.getBoolean("is_paid"));
                medicalReports.add(medicalReport);
            }
            return medicalReports;
        } catch (SQLException ex) {
            Logger.getLogger(MedicalReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<MedicalReport> SearchMedicalReports(int patientId, int doctorId, String from, String to) {
        try {
            ArrayList<MedicalReport> medicalReports = new ArrayList<>();
            String sql = "SELECT *FROM swp391_project.medical_report\n"
                    + "where patient_id = ? and doctor_id = ? and DATE(time) between ? and ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, patientId);
            stm.setInt(2, doctorId);
            stm.setString(3, from);
            stm.setString(4, to);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                MedicalReport medicalReport = new MedicalReport();
                medicalReport.setSymptom(rs.getString("symptom"));
                medicalReport.setResult(rs.getString("result"));
                medicalReport.setPatient_id(patientId);
                medicalReport.setDoctor_id(doctorId);
                medicalReport.setTime(DateTimeHelper.toLocalDateTime(rs.getString("time")));
                medicalReport.setPaid(rs.getBoolean("is_paid"));

                medicalReports.add(medicalReport);
            }
            return medicalReports;
        } catch (SQLException ex) {
            Logger.getLogger(MedicalReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<MedicalReport> SearchMedicalReportsNoDoctorId(int patientId, String from, String to) {
        try {
            ArrayList<MedicalReport> medicalReports = new ArrayList<>();
            String sql = "SELECT *FROM swp391_project.medical_report\n"
                    + "where patient_id = ? and DATE(time) between ? and ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, patientId);
            stm.setString(2, from);
            stm.setString(3, to);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                MedicalReport medicalReport = new MedicalReport();
                medicalReport.setSymptom(rs.getString("symptom"));
                medicalReport.setResult(rs.getString("result"));
                medicalReport.setPatient_id(patientId);
                medicalReport.setDoctor_id(rs.getInt("doctor_id"));
                medicalReport.setTime(DateTimeHelper.toLocalDateTime(rs.getString("time")));
                medicalReport.setPaid(rs.getBoolean("is_paid"));

                medicalReports.add(medicalReport);
            }
            return medicalReports;
        } catch (SQLException ex) {
            Logger.getLogger(MedicalReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        MedicalReportDBContext context = new MedicalReportDBContext();
        ArrayList<MedicalReport> medicalReports = context.SearchMedicalReports(5, 6, "2023-02-28", "2023-03-11");
        System.out.println(medicalReports.size());
    }
}
