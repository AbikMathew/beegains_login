class EnquiryListResponse {
  final bool success;
  final String message;
  final Data data;

  EnquiryListResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory EnquiryListResponse.fromMap(Map<String, dynamic> json) =>
      EnquiryListResponse(
        success: json["success"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );
}

class Data {
  final Enquiries enquiries;

  Data({
    required this.enquiries,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        enquiries: Enquiries.fromMap(json["enquiries"]),
      );
}

class Enquiries {
  final int currentPage;
  final List<Enquiry> enquiry;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final String path;
  final int perPage;
  final int to;
  final int total;

  Enquiries({
    required this.currentPage,
    required this.enquiry,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Enquiries.fromMap(Map<String, dynamic> json) {
    return Enquiries(
      currentPage: json["current_page"],
      enquiry: List<Enquiry>.from(
        json["data"].map(
          (enquiry) => Enquiry.fromMap(enquiry),
        ),
      ),
      firstPageUrl: json["first_page_url"],
      from: json["from"],
      lastPage: json["last_page"],
      lastPageUrl: json["last_page_url"],
      path: json["path"],
      perPage: json["per_page"],
      to: json["to"],
      total: json["total"],
    );
  }
}

class Enquiry {
  final int id;
  final String enquiryNo;
  final String rcOwnerName;
  final String rcOwnerDistrict;
  final String name;
  final String primaryMobile;
  final String district;
  final int kms;
  final String enquiryDate;
  // final AssignedTo assignedTo;
  // final VehicleMake vehicleMake;

  Enquiry({
    required this.id,
    required this.enquiryNo,
    required this.rcOwnerName,
    required this.rcOwnerDistrict,
    required this.name,
    required this.primaryMobile,
    required this.district,
    required this.kms,
    required this.enquiryDate,
    // required this.assignedTo,
    // required this.vehicleMake,
  });

  factory Enquiry.fromMap(Map<String, dynamic> json) => Enquiry(
        id: json["id"],
        enquiryNo: json["enquiry_no"],
        rcOwnerName: json["rc_owner_name"],
        rcOwnerDistrict: json["rc_owner_district"],
        name: json["name"],
        primaryMobile: json["primary_mobile"],
        district: json["district"],
        kms: json["kms"],
        enquiryDate: json["enquiry_date"],
        // assignedTo: AssignedTo.fromMap(json["assigned_to"]),
        // vehicleMake: VehicleMake.fromMap(json["vehicle_make"]),
      );
}

class AssignedTo {
  final int id;
  final String employeeName;

  AssignedTo({
    required this.id,
    required this.employeeName,
  });

  factory AssignedTo.fromMap(Map<String, dynamic> json) => AssignedTo(
        id: json["id"],
        employeeName: json["employee_name"],
      );
}

class VehicleMake {
  final int id;
  final String make;

  VehicleMake({
    required this.id,
    required this.make,
  });

  factory VehicleMake.fromMap(Map<String, dynamic> json) => VehicleMake(
        id: json["id"],
        make: json["make"],
      );
}
