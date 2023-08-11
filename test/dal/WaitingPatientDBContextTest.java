/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.WaitingPatient;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author nguye
 */
public class WaitingPatientDBContextTest {
    
    public WaitingPatientDBContextTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of insert method, of class WaitingPatientDBContext.
     */
    @Test
    public void testInsert() {
        System.out.println("insert");
        WaitingPatient model = null;
        WaitingPatientDBContext instance = new WaitingPatientDBContext();
        instance.insert(model);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of update method, of class WaitingPatientDBContext.
     */
    @Test
    public void testUpdate() {
        System.out.println("update");
        WaitingPatient model = null;
        WaitingPatientDBContext instance = new WaitingPatientDBContext();
        instance.update(model);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of delete method, of class WaitingPatientDBContext.
     */
    @Test
    public void testDelete() {
        System.out.println("delete");
        WaitingPatient model = null;
        WaitingPatientDBContext instance = new WaitingPatientDBContext();
        instance.delete(model);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of deleteByPatientId method, of class WaitingPatientDBContext.
     */
    @Test
    public void testDeleteByPatientId() {
        System.out.println("deleteByPatientId");
        int patient_id = 2;
        WaitingPatientDBContext instance = new WaitingPatientDBContext();
        instance.deleteByPatientId(patient_id);
    }

    /**
     * Test of get method, of class WaitingPatientDBContext.
     */
    @Test
    public void testGet() {
        System.out.println("get");
        int id = 0;
        WaitingPatientDBContext instance = new WaitingPatientDBContext();
        WaitingPatient expResult = null;
        WaitingPatient result = instance.get(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of list method, of class WaitingPatientDBContext.
     */
    @Test
    public void testList() {
        System.out.println("list");
        WaitingPatientDBContext instance = new WaitingPatientDBContext();
        ArrayList<WaitingPatient> expResult = null;
        ArrayList<WaitingPatient> result = instance.list();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of insertByPatientID method, of class WaitingPatientDBContext.
     */
    @Test
    public void testInsertByPatientID() {
        System.out.println("insertByPatientID");
        int patient_id = 2;
        String reason = "adf";
        String book_created_time = null;
        WaitingPatientDBContext instance = new WaitingPatientDBContext();
        instance.insertByPatientID(patient_id, reason, book_created_time);
        
    }

    /**
     * Test of updateByPatientId method, of class WaitingPatientDBContext.
     */
    @Test
    public void testUpdateByPatientId() {
        System.out.println("updateByPatientId");
        int patient_id = 0;
        int room = 0;
        WaitingPatientDBContext instance = new WaitingPatientDBContext();
        instance.updateByPatientId(patient_id, room);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getWaitingPatients method, of class WaitingPatientDBContext.
     */
    @Test
    public void testGetWaitingPatients() {
        System.out.println("getWaitingPatients");
        WaitingPatientDBContext instance = new WaitingPatientDBContext();
        ArrayList<WaitingPatient> expResult = null;
        ArrayList<WaitingPatient> result = instance.getWaitingPatients();
        assertEquals(expResult, result);
    }

    /**
     * Test of arrangeRoom method, of class WaitingPatientDBContext.
     */
    @Test
    public void testArrangeRoom() {
        System.out.println("arrangeRoom");
        WaitingPatientDBContext instance = new WaitingPatientDBContext();
        instance.arrangeRoom();
    }

    /**
     * Test of isRoomAvailable method, of class WaitingPatientDBContext.
     */
    @Test
    public void testIsRoomAvailable() {
        System.out.println("isRoomAvailable");
        int room_id = 2;
        WaitingPatientDBContext instance = new WaitingPatientDBContext();
        boolean expResult = true;
        boolean result = instance.isRoomAvailable(room_id);
        
        assertEquals(expResult, result);
    }
}
