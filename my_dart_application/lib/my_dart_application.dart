library my_dart_application;

import 'dart:io';
import 'dart:math';

export 'src/my_dart_application_base.dart';

void main(List<String> args) {
  print("Welcome to banking System...");
  chooseOperation();
}

void chooseOperation() {
  print("Press 1 to add another account");
  print("Press 2 to End the Program");
  int i = int.parse(stdin.readLineSync()!);
  if (i == 1) {
    fetchName();
  }
  if (i == 2) {
    print("\nEnd of the Program");
    exit(0);
  }
  if (i == 3) {
    // AccountHolder.displayRecords();
  } else {
    print("Please Choose correct option");
    chooseOperation();
  }
}

void fetchName() {
  String name;
  print("\nEnter your Name: ");
  name = stdin.readLineSync()!;
  fetchNumber(name);
}

void fetchNumber(String name) {
  int no, len;
  const mobile_len = 10;
  Random random = new Random();

  try {
    do {
      print("Enter your Mobile No.: ");
      no = int.parse(stdin.readLineSync()!);
      len = no.toString().length;
      if (len != 10) {
        print("Mobile should be contain 10 digits.");
      }
    } while (mobile_len != len);
    dynamic acc_number = random.nextInt(900000000) + 10000000000;
    BankingSystem bankingSystem = BankingSystem(name, no, acc_number);
    chooseOperation();
  } on FormatException {
    print("Enter Valid Mobile Number...");
    fetchNumber(name);
  } catch (e) {
    print(e);
  }
}

class AccountHolder {
  String nameOfAccountHolder;
  int mobileNoOfAccountHolder;
  dynamic acoountNoOfAccountHolder;

  AccountHolder(this.nameOfAccountHolder, this.mobileNoOfAccountHolder,
      this.acoountNoOfAccountHolder);
}

class BankingSystem {
  static List accountHolderList = [];
  BankingSystem(String acc_name, int acc_no, dynamic acc_accountno) {
    print("\nAccount is created");
    print("\nAccount Holder Name: $acc_name");
    print("Mobile no.: $acc_no");
    print("Account Number: $acc_accountno \n");
    accountHolderList.add(AccountHolder(acc_name, acc_no, acc_accountno));
  }

}
