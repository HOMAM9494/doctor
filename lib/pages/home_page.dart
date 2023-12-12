
import 'package:app_doctor/cells/category_cell.dart';
import 'package:app_doctor/cells/hd_cell.dart';
import 'package:app_doctor/cells/trd_cell.dart';
import 'package:app_doctor/models/category.dart';
import 'package:app_doctor/models/doctor.dart';
import 'package:app_doctor/pages/detail_page.dart';
import 'package:app_doctor/utils/custom_icons_icons.dart';
import 'package:app_doctor/utils/he_color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Doctor> _hDoctors =[] ;
  List<Category> _categories=[] ;
  List<Doctor> _trDoctors =[];

  /// **********************************************
  /// ACTIONS
  /// **********************************************

  _onCellTap(Doctor doctor) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(doctor: doctor),
        ));
  }

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  void initState() {
    super.initState();
    _hDoctors = _getHDoctors();
     _categories = _getCategories();
    _trDoctors = _getTRDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _hDoctorsSection(),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _categorySection(),
                  const SizedBox(
                    height: 32,
                  ),
                  _trDoctorsSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: HexColor('#150047')),
      leading: IconButton(
        icon: const Icon(
          CustomIcons.menu,
          size: 14,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(
            CustomIcons.search,
            size: 20,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  /// Highlighted Doctors Section
  SizedBox _hDoctorsSection() {
    return SizedBox(
      height: 199,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: _hDoctors.length,
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(indent: 16),
        itemBuilder: (BuildContext context, int index) => HDCell(
          doctor: _hDoctors[index],
          onTap: () => _onCellTap(_hDoctors[index]),
        ),
      ),
    );
  }

  /// Category Section
  Column _categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        SizedBox(
          height: 125,
          child: ListView.separated(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(indent: 16),
            itemBuilder: (BuildContext context, int index) =>
                TrdCell(doctor: _trDoctors[index]),
                //CategoryCell(category: _categories[index]),
          ),
        ),
      ],
    );
  }

  /// Top Rated Doctors Section
  Column _trDoctorsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Top Rated Doctor',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemCount: _trDoctors.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(
            thickness: 16,
            color: Colors.transparent,
          ),
          itemBuilder: (BuildContext context, int index) =>
              TrdCell(doctor: _trDoctors[index]),
        ),
      ],
    );
  }

  /// **********************************************
  /// DUMMY DATA
  /// **********************************************

  /// Get Highlighted Doctors List
  List<Doctor> _getHDoctors() {
    List<Doctor> hDoctors=[] ;

    hDoctors.add(Doctor(
      firstName: 'Albert',
      lastName: 'Alexander',
      image: 'albert.png',
      type: 'Kidney',
      rating: 4.5,
    ));
    hDoctors.add(Doctor(
      firstName: 'Elisa',
      lastName: 'Rose',
      image: 'albert.png',
      type: 'Kidney',
      rating: 4.5,
    ));

    return hDoctors;
  }

  /// Get Categories
  List<Category> _getCategories() {
    List<Category> categories = [];
    categories.add(Category(
      icon: CustomIcons.cardiologist,
      title: 'Cardiologist',
    ));
    categories.add(Category(
      icon: CustomIcons.eyes,
      title: 'Eyes',
    ));
    categories.add(Category(
      icon: CustomIcons.pediatrician,
      title: 'Pediatrician',
    ));
    return categories;
  }

  /// Get Top Rated Doctors List
  List<Doctor> _getTRDoctors() {
    List<Doctor> trDoctors =[];

    trDoctors.add(Doctor(
      firstName: 'Mathew',
      lastName: 'Chambers',
      image: 'mathew.png',
      type: 'Bone',
      rating: 4.3,
    ));
    trDoctors.add(Doctor(
        firstName: 'Cherly',
        lastName: 'Bishop',
        image: 'cherly.png',
        type: 'Kidney',
        rating: 4.7));
    trDoctors.add(Doctor(
        firstName: 'Albert',
        lastName: 'Alexander',
        image: 'albert.png',
        type: 'Kidney',
        rating: 4.3));
    trDoctors.add(Doctor(
      firstName: 'Elisa',
      lastName: 'Rose',
      image: 'albert.png',
      type: 'Kidney',
      rating: 4.5,
    ));
    return trDoctors;
  }
}
