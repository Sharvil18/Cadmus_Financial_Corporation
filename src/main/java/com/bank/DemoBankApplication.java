package com.bank;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.security.crypto.bcrypt.BCrypt;

import java.util.ArrayList;
import java.util.List;

@SpringBootApplication
@EnableScheduling
public class DemoBankApplication {

	public static void main(String[] args) {
		ArrayList<String> emailList = new ArrayList<>();

		emailList.add("Sharat.chandran@22");
		emailList.add("Kajal.mallick@23");
		emailList.add("Nahar.singh@24");
		emailList.add("Kanika.kathuria@25");
		emailList.add("Jyoti.mathur@26");
		emailList.add("Maansingh.aswal@27");
		emailList.add("Priya.jain@28");
		emailList.add("Vandana.krishnamurthy@29");
		emailList.add("Anjali.juneja@30");
		emailList.add("Tapas.das@31");
		emailList.add("Vikash.senger@32");
		emailList.add("Devinder.chadda@33");
		emailList.add("Yash.mittal@34");
		emailList.add("Gajender.singh@35");
		emailList.add("Sanjay.charee@36");
		emailList.add("Gurdeep.kaur@37");
		emailList.add("Vidhi.kashyap@38");
		emailList.add("Shelender.yadav@39");
		emailList.add("Pulkit.sharma@40");
		emailList.add("Bhagwati.prasad@41");
		emailList.add("Swati.joshi@42");
		emailList.add("Akhilesh.pandit@43");
		emailList.add("Shajiya.raghavan@44");
		emailList.add("Kaushaliya.rai@45");
		emailList.add("Subhadra.katoch@46");
		emailList.add("Anubhav.shrivastab@47");
		emailList.add("Harsh.dagar@48");
		emailList.add("Tina.singal@49");
		emailList.add("Subhash.jha@50");
		emailList.add("Sandeep.meghawal@51");
		emailList.add("Hamida.sen@52");
		emailList.add("Vipin.garg@53");
		emailList.add("Anita.zaveri@54");

		for(String password : emailList) {
			System.out.println( BCrypt.hashpw(password, BCrypt.gensalt()));
		}
		System.out.println("-----------------------");



		SpringApplication.run(DemoBankApplication.class, args);
	}

}
