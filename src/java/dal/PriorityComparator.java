/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.Comparator;
import model.WaitingPatient;

/**
 *
 * @author nguye
 */
public class PriorityComparator implements Comparator<WaitingPatient> {

    @Override
    public int compare(WaitingPatient wp1, WaitingPatient wp2) {
        // Sort by booking status (booked patients come first)
        if (wp1.getBook_created_time() != null & wp2.getBook_created_time() != null) {
            if (wp1.getBook_created_time().isBefore(wp2.getBook_created_time())) {
                return -1;
            } else if (wp1.getBook_created_time().isAfter(wp2.getBook_created_time())) {
                return 1;
            }
        }
        if (wp1.getBook_created_time() != null & wp2.getBook_created_time() == null) {
            return -1;
        }
        if (wp1.getBook_created_time() == null & wp2.getBook_created_time() != null) {
            return 1;
        }
        // If both patients are booked or both are not booked, sort by arrival time
        if (wp1.getArrival_time().isBefore(wp2.getArrival_time())) {
            return -1;
        } else if (wp1.getArrival_time().isAfter(wp2.getArrival_time())) {
            return 1;
        }

        if (wp1.getPatient_id()<wp2.getPatient_id()) {
            return -1;
        } else {
            return 1;
        }
    }
}
