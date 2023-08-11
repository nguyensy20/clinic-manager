import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

class Patient {
    private String name;
    private boolean isBooked;
    private int arrivalTime;

    public Patient(String name, boolean isBooked, int arrivalTime) {
        this.name = name;
        this.isBooked = isBooked;
        this.arrivalTime = arrivalTime;
    }

    public String getName() {
        return name;
    }

    public boolean isBooked() {
        return isBooked;
    }

    public int getArrivalTime() {
        return arrivalTime;
    }
}

class PriorityComparator implements Comparator<Patient> {
    @Override
    public int compare(Patient p1, Patient p2) {
        // Sort by booking status (booked patients come first)
        if (p1.isBooked() && !p2.isBooked()) {
            return -1;
        } else if (!p1.isBooked() && p2.isBooked()) {
            return 1;
        }

        // If both patients are booked or both are not booked, sort by arrival time
        if (p1.getArrivalTime() < p2.getArrivalTime()) {
            return -1;
        } else if (p1.getArrivalTime() > p2.getArrivalTime()) {
            return 1;
        }

        // If arrival time is the same, sort by name
        return p1.getName().compareTo(p2.getName());
    }
}

public class PatientPrioritySorter {
    public static void main(String[] args) {
        // Sample patient list
        List<Patient> patients = new ArrayList<>();
        patients.add(new Patient("Alice", true, 10));
        patients.add(new Patient("Bob", false, 8));
        patients.add(new Patient("Charlie", true, 9));
        patients.add(new Patient("David", false, 11));
        patients.add(new Patient("Eve", true, 12));
        patients.add(new Patient("Frank", false, 7));

        // Sort the patients by priority
        Collections.sort(patients, new PriorityComparator());

        // Print the sorted patient list
        for (Patient patient : patients) {
            System.out.println(patient.getName());
        }
    }
}