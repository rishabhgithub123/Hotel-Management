

public class Hotel_pojoClass {
	
	//For Room
	int room_no;
	String customer_id;
	String room_type;
	String floor;
	String status;
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	//For Staff
	int staff_id;
	String staff_name;
	String staff_gender;
	String staff_email;
	String staff_phone;
	String staff_add;
	int staff_role;
	String staff_jdate;
	public String getStaff_name() {
		return staff_name;
	}
	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}
	public String getStaff_gender() {
		return staff_gender;
	}
	public void setStaff_gender(String staff_gender) {
		this.staff_gender = staff_gender;
	}
	
	public String getStaff_jdate() {
		return staff_jdate;
	}
	public void setStaff_jdate(String staff_jdate) {
		this.staff_jdate = staff_jdate;
	}
	public String getStaff_email() {
		return staff_email;
	}
	public void setStaff_email(String staff_email) {
		this.staff_email = staff_email;
	}
	
	public String getStaff_phone() {
		return staff_phone;
	}
	public void setStaff_phone(String staff_phone) {
		this.staff_phone = staff_phone;
	}
	public String getStaff_add() {
		return staff_add;
	}
	public void setStaff_add(String staff_add) {
		this.staff_add = staff_add;
	}
	
	public int getStaff_role() {
		return staff_role;
	}
	public void setStaff_role(int staff_role) {
		this.staff_role = staff_role;
	}
	public int getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(int staff_id) {
		this.staff_id = staff_id;
	}
	
	//For Booking
	int booking_id;
	String booking_name;
	int booking_rtype;
	String booking_date;
	String booking_time;
	String booking_arrive;
	String booking_depart;
	String booking_email;
	String booking_phone;
	String booking_message;
	public int getBooking_id() {
		return booking_id;
	}
	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}
	public String getBooking_name() {
		return booking_name;
	}
	public void setBooking_name(String booking_name) {
		this.booking_name = booking_name;
	}
	public int getBooking_rtype() {
		return booking_rtype;
	}
	public void setBooking_rtype(int booking_rtype) {
		this.booking_rtype = booking_rtype;
	}
	public String getBooking_date() {
		return booking_date;
	}
	public void setBooking_date(String booking_date) {
		this.booking_date = booking_date;
	}
	public String getBooking_time() {
		return booking_time;
	}
	public void setBooking_time(String booking_time) {
		this.booking_time = booking_time;
	}
	public String getBooking_arrive() {
		return booking_arrive;
	}
	public void setBooking_arrive(String booking_arrive) {
		this.booking_arrive = booking_arrive;
	}
	public String getBooking_depart() {
		return booking_depart;
	}
	public void setBooking_depart(String booking_depart) {
		this.booking_depart = booking_depart;
	}
	public String getBooking_email() {
		return booking_email;
	}
	public void setBooking_email(String booking_email) {
		this.booking_email = booking_email;
	}
	public String getBooking_phone() {
		return booking_phone;
	}
	public void setBooking_phone(String booking_phone) {
		this.booking_phone = booking_phone;
	}
	public String getBooking_message() {
		return booking_message;
	}
	public void setBooking_message(String booking_message) {
		this.booking_message = booking_message;
	}
	
	//For Payment
	String payment_type;
	String payment_date;
	int amount;
	String status2;
	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getStatus2() {
		return status2;
	}
	public void setStatus2(String status2) {
		this.status2 = status2;
	}
	
	// for Customer
	
		String C_name;
		String location;
		String checkin;
		String checkout;
		String Croom_type;
		public String getC_name() {
			return C_name;
		}
		public void setC_name(String c_name) {
			C_name = c_name;
		}
		public String getLocation() {
			return location;
		}
		public void setLocation(String location) {
			this.location = location;
		}
		public String getCheckin() {
			return checkin;
		}
		public void setCheckin(String checkin) {
			this.checkin = checkin;
		}
		public String getCheckout() {
			return checkout;
		}
		public void setCheckout(String checkout) {
			this.checkout = checkout;
		}
		public String getCroom_type() {
			return Croom_type;
		}
		public void setCroom_type(String croom_type) {
			Croom_type = croom_type;
		}
		
		// for Feedback
		
			String fname;
			String feedback;
			public String getFname() {
				return fname;
			}
			public void setFname(String fname) {
				this.fname = fname;
			}
			public String getFeedback() {
				return feedback;
			}
			public void setFeedback(String feedback) {
				this.feedback = feedback;
			}
}
