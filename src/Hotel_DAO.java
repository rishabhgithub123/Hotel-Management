

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;



public class Hotel_DAO {
	
	Connection con = null;
	PreparedStatement stmt = null;
	

	public Hotel_DAO() throws ClassNotFoundException, SQLException {
		con = DBconnection.getConnection();
	}
	
	// To add the room
	public void addRoom(Hotel_pojoClass obj) throws SQLException {
		String INSERTQUERY = "insert into room_info values(?,?,?,?,?)";
		stmt = con.prepareStatement(INSERTQUERY);
		stmt.setInt(1, obj.getRoom_no());
		stmt.setString(2, "NULL");
		stmt.setString(3, obj.getRoom_type());
		stmt.setString(4, obj.getFloor());
		stmt.setString(5, "INACTIVE");
		stmt.execute();
		
	}
	
	// To edit the room
	public void editRoom(Hotel_pojoClass obj) throws SQLException {
		String INSERTQUERY = "update room_info set room_type=? where room_no=?";
		stmt = con.prepareStatement(INSERTQUERY);
		stmt.setString(1, obj.getRoom_type());
		stmt.setInt(2, obj.getRoom_no());
		stmt.execute();
		
	}
	
	// To delete the room
	public void deleteRoom(Hotel_pojoClass obj) throws SQLException {
		String INSERTQUERY = "delete from room_info where room_no=? and customer_id='NULL'";
		stmt = con.prepareStatement(INSERTQUERY);
		stmt.setInt(1, obj.getRoom_no());
		stmt.execute();
			
		}
		
	// to add the staff
	public void addStaff(Hotel_pojoClass obj) throws SQLException, ParseException {
			
		String str_date = obj.getStaff_jdate();
		Date date = new SimpleDateFormat("dd/MM/yyyy").parse(str_date);
		java.sql.Date sDate = new java.sql.Date(date.getTime());
		String INSERTQUERY = "insert into staff_info values(?,?,?,?,?,?,?,?)";
		stmt = con.prepareStatement(INSERTQUERY);
		stmt.setInt(1, obj.getStaff_id());
		stmt.setString(2, obj.getStaff_name());
		stmt.setString(3, obj.getStaff_gender());
		stmt.setString(4, obj.getStaff_email());
		stmt.setString(5, obj.getStaff_phone());
		stmt.setInt(6, obj.getStaff_role());
		stmt.setDate(7, sDate);
		stmt.setString(8, obj.getStaff_add());
		stmt.execute();
				
		}
		
	// To delete the staff
	public void deleteStaff(Hotel_pojoClass obj) throws SQLException {
		String INSERTQUERY = "delete from staff_info where staff_id=?";
		stmt = con.prepareStatement(INSERTQUERY);
		stmt.setInt(1, obj.getStaff_id());
		stmt.execute();	
		}
	// To update the staff	
	public void editStaff(Hotel_pojoClass obj) throws SQLException {
		String INSERTQUERY = "update staff_info set staff_email=?,staff_phone=?,staff_add=? where staff_id=?";
		stmt = con.prepareStatement(INSERTQUERY);
		stmt.setString(1, obj.getStaff_email());
		stmt.setString(2, obj.getStaff_phone());
		stmt.setString(3, obj.getStaff_add());
		stmt.setInt(4, obj.getStaff_id());
		stmt.execute();
		}
	
	// To Add Booking
	public void addBooking(Hotel_pojoClass obj) throws SQLException, ParseException {
		
		String str_date = obj.getBooking_date();
		Date date = new SimpleDateFormat("dd/MM/yyyy").parse(str_date);
		java.sql.Date sDate = new java.sql.Date(date.getTime());
		String str_date2 = obj.getBooking_arrive();
		Date date2 = new SimpleDateFormat("dd/MM/yyyy").parse(str_date2);
		java.sql.Date s2Date = new java.sql.Date(date2.getTime());
		String str_date3 = obj.getBooking_depart();
		Date date3 = new SimpleDateFormat("dd/MM/yyyy").parse(str_date3);
		java.sql.Date s3Date = new java.sql.Date(date3.getTime());
		String INSERTQUERY = "insert into booking_info values(?,?,?,?,?,?,?,?,?,?,?)";
		stmt = con.prepareStatement(INSERTQUERY);
		stmt.setInt(1, obj.getBooking_id());
		stmt.setString(2, obj.getBooking_name());
		stmt.setInt(3, obj.getBooking_rtype());
		stmt.setInt(4, obj.getRoom_no());
		stmt.setDate(5, sDate);
		stmt.setString(6, obj.getBooking_time());
		stmt.setDate(7, s2Date);
		stmt.setDate(8, s3Date);
		stmt.setString(9, obj.getBooking_email());
		stmt.setString(10, obj.getBooking_phone());
		stmt.setString(11, obj.getBooking_message());
		stmt.execute();
		INSERTQUERY = "update room_info set customer_id=?, status=? where room_no=?";
		stmt = con.prepareStatement(INSERTQUERY);
		stmt.setInt(1, obj.getBooking_id());
		stmt.setString(2, "ACTIVE");
		stmt.setInt(3, obj.getRoom_no());
		stmt.execute();
		INSERTQUERY = "insert into payment_info(booking_id,status) values(?,?)";
		stmt = con.prepareStatement(INSERTQUERY);
		stmt.setInt(1, obj.getBooking_id());
		stmt.setString(2, "UNPAID");
		stmt.execute();
				
		}
	
	// To Edit booking
	public void editBooking(Hotel_pojoClass obj) throws SQLException, ParseException {
		String str_date = obj.getBooking_depart();
		Date date = new SimpleDateFormat("dd/MM/yyyy").parse(str_date);
		java.sql.Date sDate = new java.sql.Date(date.getTime());
		String INSERTQUERY = "update booking_info set depart_date=?, b_email=?,b_phone=?,b_message=? where b_id=?";
		stmt = con.prepareStatement(INSERTQUERY);
		stmt.setDate(1, sDate);
		stmt.setString(2, obj.getBooking_email());
		stmt.setString(3, obj.getBooking_phone());
		stmt.setString(4, obj.getBooking_message());
		stmt.setInt(5, obj.getBooking_id());
		stmt.execute();
		}
	
	// To delete the booking
	public void deleteBooking(Hotel_pojoClass obj) throws SQLException {
		String INSERTQUERY = "delete from booking_info where b_id=?";
		stmt = con.prepareStatement(INSERTQUERY);
		stmt.setInt(1, obj.getBooking_id());
		stmt.execute();	
		INSERTQUERY = "update room_info set customer_id=?, status=? where room_no=?";
		stmt = con.prepareStatement(INSERTQUERY);
		stmt.setString(1, "NULL");
		stmt.setString(2, "INACTIVE");
		stmt.setInt(3, obj.getRoom_no());
		stmt.execute();
		INSERTQUERY = "delete from payment_info where booking_id=?";
		stmt = con.prepareStatement(INSERTQUERY);
		stmt.setInt(1, obj.getBooking_id());
		stmt.execute();	
		}
	
	// for payment
		public void Payment(Hotel_pojoClass obj) throws SQLException, ParseException {
				
			String str_date = obj.getPayment_date();
			Date date = new SimpleDateFormat("dd/MM/yyyy").parse(str_date);
			java.sql.Date sDate = new java.sql.Date(date.getTime());
			String INSERTQUERY = "update payment_info set payment_type=?,payment_date=?,amount=?,status=? where booking_id=?";
			stmt = con.prepareStatement(INSERTQUERY);
			stmt.setString(1, obj.getPayment_type());
			stmt.setDate(2, sDate);
			stmt.setInt(3, obj.getAmount());
			stmt.setString(4, obj.getStatus2());
			stmt.setInt(5, obj.getBooking_id());
			stmt.execute();
			}
		
		// to add customer
		public void addCustomer(Hotel_pojoClass obj) throws SQLException, ParseException {
				
			String str_date = obj.getCheckin();
			Date date = new SimpleDateFormat("dd/MM/yyyy").parse(str_date);
			java.sql.Date sDate = new java.sql.Date(date.getTime());
			String str_date2 = obj.getCheckout();
			Date date2 = new SimpleDateFormat("dd/MM/yyyy").parse(str_date2);
			java.sql.Date s2Date = new java.sql.Date(date2.getTime());
			String INSERTQUERY = "insert into customer_info(c_name,contact,a_date,d_date,room_type) values(?,?,?,?,?)";
			stmt = con.prepareStatement(INSERTQUERY);
			stmt.setString(1, obj.getC_name());
			stmt.setString(2, obj.getLocation());
			stmt.setDate(3, sDate);
			stmt.setDate(4, s2Date);
			stmt.setString(5, obj.getCroom_type());
			stmt.execute();
					
			}
		
		// for feedback
		
		public void addFeedback(Hotel_pojoClass obj) throws SQLException, ParseException {
			String INSERTQUERY = "insert into feedback_info(name,message) values(?,?)";
			stmt = con.prepareStatement(INSERTQUERY);
			stmt.setString(1, obj.getFname());
			stmt.setString(2, obj.getFeedback());
			stmt.execute();		
			}
		
		// To delete customer
		public void deleteCust(Hotel_pojoClass obj) throws SQLException {
			String INSERTQUERY = "delete from customer_info where c_id=?";
			stmt = con.prepareStatement(INSERTQUERY);
			stmt.setInt(1, obj.getStaff_id());
			stmt.execute();
				
			}
}
