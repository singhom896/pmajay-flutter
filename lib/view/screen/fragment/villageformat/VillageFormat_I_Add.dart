import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:pmajay/utills/AppString.dart';
import 'package:provider/provider.dart';
import '../../../../network/data/AddCommittee.dart';
import '../../../../network/remote/Status.dart';
import '../../../../network/response/BlockListResponse.dart';
import '../../../../network/response/DesignationListResponse.dart';
import '../../../../network/response/GramListResponse.dart';
import '../../../../network/response/VillageListResponse.dart';
import '../../../../network/viewmodel/PmajayVM.dart';
import '../../../../utills/SharedPreferencesHelper.dart';
import '../../../widget/DynamicWidgets.dart';
import '../../../../utills/CustomColor.dart';
import '../../../../utills/FontSize.dart';
import '../../../widget/ExpandableTextWidget.dart';
import '../../../widget/ResizableTextView.dart';

class VillageFormat_I_Add extends StatefulWidget {
  const VillageFormat_I_Add({super.key});

  @override
  State<VillageFormat_I_Add> createState() => _village_format_i_addState();
}

class _village_format_i_addState extends State<VillageFormat_I_Add> {
  final _formKey = GlobalKey<FormState>();
  String blockValue = "--Select--";
  String gramValue = "--Select--";

  List<String> get dropdownblockItems {
    List<String> menuItems = ["--Select--", "Delhi W Est", "Delhi W Est1"];
    return menuItems;
  }

  List<String> get dropdownGramItems {
    List<String> menuItems = ["--Select--", "Delhi W Est", "Delhi W Est1"];
    return menuItems;
  }

  late String _myActivity;
  late String _myActivityResult;

  _saveForm() {
    var form = _formKey.currentState;
    if (form!.validate())
    {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  final Location location = Location();

  PermissionStatus? _permissionGranted;

  @override
  void initState() {
    super.initState();
    initview();


    getsharePref();
    _myActivity = '';
    _myActivityResult = '';
    clickevent = false;
    addDynamic();
    _checkPermissions();
    _startLocationUpdates();
    setDataList();
    select_designation = '';
    _myActivityResult = '';
    clickevent = false;
  }
  List<AddCommittee?> committeeListData=[];
 Future<void>initview()
  async {
    // data_list =Provider.of<PmajayVM>(context, listen: false) .getCommitteeList;

    blocklist.add(BlockResult(BlockCode:'0',BlockName:'--Select Block---'));
    selectblockvalue=blocklist[0];

    gramlist.insert(
      0,
      GramResult(GpCode:'',GpName:'--Select GramPanchayat--'),
    );
    selectGramvalue = gramlist[0];

    villagelist.insert(
      0,
      VillageResult(VillageCode:'',VillageName:'--Select Village Name--'),
    );
    selectvillagealue = villagelist[0];

  }
  Future<void>resetDropDown()async {
    gramlist.clear();
    villagelist.clear();
    gramlist.insert(
      0,
      GramResult(GpCode:'',GpName:'--Select GramPanchayat--'),
    );
    selectGramvalue = gramlist[0];

    villagelist.insert(
      0,
      VillageResult(VillageCode:'',VillageName:'--Select Village Name--'),
    );
    selectvillagealue = villagelist[0];
  }


  late final viewmodelListner;
  late  String State="";
  late  String StateCode="";
  late  String District="";
  late  String DistrictCode="";
  Future<void> getsharePref() async
  {
    String? _State =    await SharedPreferencesHelper.getPreferance(AppString.pref_State);
    String? _StateCode =    await SharedPreferencesHelper.getPreferance(AppString.pref_StateCode);
    String? _District =    await SharedPreferencesHelper.getPreferance(AppString.pref_District);
    String? _DistrictCode =    await SharedPreferencesHelper.getPreferance(AppString.pref_DistrictCode);

    setState(() {
      State = _State??"";
      StateCode = _StateCode??"";
      District = _District??"";
      DistrictCode = _DistrictCode??"";

    });
    viewmodelListner = Provider.of<PmajayVM>(context, listen: false);
    viewmodelListner.addListener(getdesignation);
    viewmodelListner.addListener(allBlockList);
    viewmodelListner.addListener(allGramList);
    viewmodelListner.addListener(allVillageList);
    viewmodelListner.getDesignList('');
    viewmodelListner.getBlockList('', DistrictCode!);


  }
  void getdesignation()
  {
    if (viewmodelListner.designationMain.status == Status.LOADING)
    {
      setState(() {
        isLoading = true;
      }); // Update the UI if necessary
    }

    if (viewmodelListner.designationMain.status == Status.ERROR) {
      setState(() {
        isLoading = false;
      }); // Update the U
    }
    if (viewmodelListner.designationMain.status == Status.COMPLETED)
    {
      if (viewmodelListner.designationMain.data.response.status == true )
      {
        setState(() {
          isLoading = false;
        }); // Update the UI if necessary

        designationlist.clear();
        // blocklist.add(BlockResult(BlockCode:'',BlockName:'--Select Block---'));
        designationlist.addAll(viewmodelListner.designationMain.data.response.dataResult);
        designationlist.insert(
          0,
          DesignationResult(Designation:'---Select Designation---'),
        );
        designationvalue = designationlist[0];

        viewmodelListner.removeListener(getdesignation);
        setState(() {

        });

      } else {
        setState(() {
          isLoading = false;
        }); // Update the UI if necessary
      }
    }
  }


  bool isLoading = true;

  Future<void> setDataList() async
  {
    // var data_add = AddCommittee(
    //     Name: '',
    //     Designation: '',
    //     MobileNo: '',
    //     Email: '',
    //     Address: '',
    //     Remark: '');
    // committeeListData.add(data_add);
    //
    // Provider.of<PmajayVM>(context, listen: false).setAddCommitteeList = committeeListData;
    committeeListData =Provider.of<PmajayVM>(context, listen: false).getCommitteeList;
  }

  void allBlockList() {
    if (viewmodelListner.bloackMain.status == Status.LOADING) {
      setState(() {
        isLoading = true;
      }); // Update the UI if necessary
    }

    if (viewmodelListner.bloackMain.status == Status.ERROR) {}
    if (viewmodelListner.bloackMain.status == Status.COMPLETED)
    {
      if (viewmodelListner.bloackMain.data.response.status == true )
      {
        setState(() {
          isLoading = false;
        }); // Update the UI if necessary

        blocklist.clear();
        // blocklist.add(BlockResult(BlockCode:'',BlockName:'--Select Block---'));
        blocklist.addAll(viewmodelListner.bloackMain.data.response.dataResult);
        blocklist.removeAt(0);
        blocklist.insert(
          0,
          BlockResult(BlockCode:'',BlockName:'--Select Block---'),
        );
        selectblockvalue = blocklist[0];
        viewmodelListner.removeListener(allBlockList);
        setState(() {

        });

      } else {
        setState(() {
          isLoading = false;
        }); // Update the UI if necessary
      }
    }
  }
  void allGramList() {
    if (viewmodelListner.gramMain.status == Status.LOADING) {
      setState(() {
        isLoading = true;
      }); // Update the UI if necessary
    }

    if (viewmodelListner.gramMain.status == Status.ERROR) {}
    if (viewmodelListner.gramMain.status == Status.COMPLETED)
    {
      if (viewmodelListner.gramMain.data.response.status == true )
      {
        viewmodelListner.removeListener(allGramList);
        setState(() {
          isLoading = false;
        }); // Update the UI if necessary

        gramlist.clear();
        // blocklist.add(BlockResult(BlockCode:'',BlockName:'--Select Block---'));
        gramlist.addAll(viewmodelListner.gramMain.data.response.dataResult);
        // gramlist.removeAt(0);
        gramlist.insert(
          0,
          GramResult(GpCode:'',GpName:'--Select GramPanchayat--'),
        );
        selectGramvalue = gramlist[0];

        villagelist.clear();
        villagelist.insert(
          0,
          VillageResult(VillageCode:'',VillageName:'--Select Village Name--'),
        );
        selectvillagealue = villagelist[0];



        setState(() {

        });

      } else {
        setState(() {
          isLoading = false;
        }); // Update the UI if necessary
      }
    }
  }

  void allVillageList()
  {
    if (viewmodelListner.villageMain.status == Status.LOADING) {
      setState(() {
        isLoading = true;
      }); // Update the UI if necessary
    }

    if (viewmodelListner.villageMain.status == Status.ERROR) {}
    if (viewmodelListner.villageMain.status == Status.COMPLETED)
    {
      if (viewmodelListner.villageMain.data.response.status == true )
      {
        setState(() {
          isLoading = false;
        }); // Update the UI if necessary

        villagelist.clear();
        // blocklist.add(BlockResult(BlockCode:'',BlockName:'--Select Block---'));
        villagelist.addAll(viewmodelListner.villageMain.data.response.dataResult);
        // gramlist.removeAt(0);
        villagelist.insert(
          0,
          VillageResult(VillageCode:'',VillageName:'--Select Village Name--'),
        );
        selectvillagealue = villagelist[0];
        // viewmodelListner.removeListener(allGramList);
        setState(() {

        });

      } else {
        setState(() {
          isLoading = false;
        }); // Update the UI if necessary
      }
    }
  }
  late DesignationResult designationvalue;
  late BlockResult selectblockvalue;
  List<DesignationResult> designationlist = [];
  List<BlockResult> blocklist = [];
  List<GramResult> gramlist = [];
  late GramResult selectGramvalue;

  List<VillageResult> villagelist = [];
  late VillageResult selectvillagealue;
  List<Map<String, dynamic>> blocklistAsMap=[];



  @override
  void dispose() {
    _stopLocationUpdates();
    viewmodelListner.removeListener(allBlockList);
    viewmodelListner.removeListener(allGramList);
    viewmodelListner.removeListener(allVillageList);
    viewmodelListner.removeListener(getdesignation);

    super.dispose();
  }

  LocationData? _locationData;
  StreamSubscription<LocationData>? _locationSubscription;

  void _startLocationUpdates() {
    _locationSubscription = Location().onLocationChanged.listen((locationData) {
      setState(() {
        _locationData = locationData;
      });
    });
  }

  void _stopLocationUpdates() {
    _locationSubscription?.cancel();
  }

  Future<void> _checkPermissions() async {
    final permissionGrantedResult = await location.hasPermission();
    setState(() {
      _permissionGranted = permissionGrantedResult;
    });
    if (_permissionGranted != PermissionStatus.granted) {
      final permissionRequestedResult = await location.requestPermission();
      setState(() {
        _permissionGranted = permissionRequestedResult;
      });
    } else {
      _checkService();
    }
  }

  bool? _serviceEnabled;

  Future<void> _checkService() async {
    final serviceEnabledResult = await location.serviceEnabled();

    setState(() {
      _serviceEnabled = serviceEnabledResult;
    });

    if (!(_serviceEnabled ?? false)) {
      final serviceRequestedResult = await location.requestService();
      setState(() {
        _serviceEnabled = serviceRequestedResult;
      });
      if (_serviceEnabled == false) {
        _checkService();
      }
    }
  }

  late bool clickevent;

  List<Widget> widgets = [];

  addDynamic() {
    setState(() {
      widgets.add(new dynamicWidget());
    });
  }

  List<String> Price = [];

  List<String> Product = [];
  List<dynamicWidget> dynamicList = [];
  List<AddCommittee> committeeList = [];

  Widget dividerLine() {
    return Container(
      margin: const EdgeInsets.only(left: 3, right: 3),
      child: const Divider(
        color: Colors.grey,
        thickness: 0.5,
      ),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    Navigator.pop(context, true);
    return true; // Example: Always allow back navigation
  }
  AddCommittee addCommittee = AddCommittee();
  late String select_designation;
  TextEditingController name = new TextEditingController();
  TextEditingController designation = new TextEditingController();

  TextEditingController mobileno = new TextEditingController();

  TextEditingController emailid = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController remark = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    double latitude = _locationData?.latitude ?? 0.0;
    double longitude = _locationData?.longitude ?? 0.0;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(0),
            ),
          ),
          title: Align(
              alignment: Alignment.topLeft,
              child: ToolbarTextView(AppString.title_assessment_format_i,
                  FontSize.sp_18, CustomColor.white, FontWeight.bold)),
          backgroundColor: CustomColor.theme_color1,
          elevation: 2.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            tooltip: 'Menu Icon',
            onPressed: () {
              _onBackPressed(context);
            },
          ),
        ),
        body: Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: 60),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: CustomColor.black_light, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5.0),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: CustomColor.theme_color1,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(5.0),
                                      topLeft: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0),
                                      bottomRight: Radius.circular(5.0)),
                                ),
                                child: Text(
                                  '1.Village Level Data',
                                  style: TextStyle(
                                      fontSize: 18.00,
                                      color: CustomColor.white),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, bottom: 5),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only( top: 12),
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              // Background color
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.green
                                                      .withOpacity(0.5),
                                                  // Elevation color
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                  offset: Offset(0,
                                                      1), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            width: MediaQuery.of(context).size.width,
                                            child: Container(
                                                margin: EdgeInsets.only(top: 10),
                                                padding: EdgeInsets.all(5),

                                                child: Text(
                                                    '${State}',
                                                    style: TextStyle(
                                                        fontSize: FontSize.sp_17,
                                                        fontWeight: FontWeight.bold,
                                                        color:
                                                        CustomColor.black_dark))),
                                          ),
                                          Positioned(
                                            left: 10,
                                            top: 3,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: 3),
                                              color: Colors.white,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: 'State',
                                                  style: TextStyle(color: Colors.black),
                                                  /*defining default style is optional */
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: ' *',
                                                        style: TextStyle(fontWeight: FontWeight.bold,color:  Colors.red)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),



                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only( top: 12),
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              // Background color
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.green
                                                      .withOpacity(0.5),
                                                  // Elevation color
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                  offset: Offset(0,
                                                      1), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            width: MediaQuery.of(context).size.width,
                                            child: Container(
                                                margin: EdgeInsets.only(top: 10),
                                                padding: EdgeInsets.all(5),

                                                child: Text(
                                                    '${District}',
                                                    style: TextStyle(
                                                        fontSize: FontSize.sp_17,
                                                        fontWeight: FontWeight.bold,
                                                        color:
                                                        CustomColor.black_dark))),
                                          ),
                                          Positioned(
                                            left: 10,
                                            top: 3,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: 3),
                                              color: Colors.white,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: 'District',
                                                  style: TextStyle(color: Colors.black),
                                                  /*defining default style is optional */
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: ' *',
                                                        style: TextStyle(fontWeight: FontWeight.bold,color:  Colors.red)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),



                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only( top: 9),
                                            height: 65,
                                            child: DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                enabledBorder: OutlineInputBorder( //<-- SEE HERE
                                                  borderSide: BorderSide(color: Colors.green.withOpacity(0.5), width: 2),
                                                ),
                                                focusedBorder: OutlineInputBorder( //<-- SEE HERE
                                                  borderSide: BorderSide(color: CustomColor.drawer_bg.withOpacity(0.5), width: 2),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                              ),
                                              dropdownColor: Colors.white,
                                              value: selectblockvalue,
                                              onChanged: (BlockResult? newValue) {


                                                setState(() {

                                                  selectblockvalue = newValue!;
                                                });

                                                if (selectblockvalue.BlockName != '--Select Block---')
                                                {
                                                  viewmodelListner.addListener(allGramList);

                                                  viewmodelListner.getGramList('', selectblockvalue.BlockCode!);
                                                }
                                                else
                                                  {
                                                    gramlist.clear();

                                                    gramlist.insert(
                                                      0,
                                                      GramResult(GpCode:'',GpName:'--Select GramPanchayat--'),
                                                    );
                                                    selectGramvalue = gramlist[0];

                                                    villagelist.clear();
                                                    villagelist.insert(
                                                      0,
                                                      VillageResult(VillageCode:'',VillageName:'--Select Village Name--'),
                                                    );
                                                    selectvillagealue = villagelist[0];

                                                  }

                                              },
                                              items: blocklist.map<DropdownMenuItem<BlockResult>>((BlockResult value) {
                                                return DropdownMenuItem<BlockResult>(
                                                  value: value,
                                                  child: Text(
                                                    value.BlockName??"",
                                                    style: TextStyle(fontSize: FontSize.sp_15),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                          Positioned(
                                            left: 10,
                                            top: 3,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: 3),
                                              color: Colors.white,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: 'Block',
                                                  style: TextStyle(color: Colors.black),
                                                  /*defining default style is optional */
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: ' *',
                                                        style: TextStyle(fontWeight: FontWeight.bold,color:  Colors.red)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),

                                    Container(
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only( top: 9),
                                            height: 65,
                                            child: DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                enabledBorder: OutlineInputBorder( //<-- SEE HERE
                                                  borderSide: BorderSide(color: Colors.green.withOpacity(0.5), width: 2),
                                                ),
                                                focusedBorder: OutlineInputBorder( //<-- SEE HERE
                                                  borderSide: BorderSide(color: CustomColor.drawer_bg.withOpacity(0.5), width: 2),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                              ),
                                              dropdownColor: Colors.white,
                                              value: selectGramvalue,
                                              onChanged: (GramResult? newValue) {
                                                setState(() {
                                                  selectGramvalue = newValue!;
                                                });

                                                if (newValue?.GpName != '--Select GramPanchayat--')
                                                {
                                                  villagelist.clear();
                                                  villagelist.insert(
                                                    0,
                                                    VillageResult(VillageCode:'',VillageName:'--Select Village Name--'),
                                                  );
                                                  selectvillagealue = villagelist[0];
                                                  setState(() {

                                                  });
                                                  viewmodelListner.addListener(allVillageList);

                                                  viewmodelListner.getVillageList('', newValue?.GpCode!);
                                                }
                                                else
                                                  {
                                                    villagelist.clear();
                                                    villagelist.insert(
                                                      0,
                                                      VillageResult(VillageCode:'',VillageName:'--Select Village Name--'),
                                                    );
                                                    selectvillagealue = villagelist[0];
                                                    setState(() {

                                                    });

                                                  }



                                              },
                                              items: gramlist.map<DropdownMenuItem<GramResult>>((GramResult value) {
                                                return DropdownMenuItem<GramResult>(
                                                  value: value,
                                                  child: Text(
                                                    value.GpName??"",
                                                    style: TextStyle(fontSize: FontSize.sp_15),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                          Positioned(
                                            left: 10,
                                            top: 3,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: 3),
                                              color: Colors.white,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: 'Gram Panchayat',
                                                  style: TextStyle(color: Colors.black),
                                                  /*defining default style is optional */
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: ' *',
                                                        style: TextStyle(fontWeight: FontWeight.bold,color:  Colors.red)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),


                                    Container(
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only( top: 9),
                                            height: 65,
                                            child: DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                enabledBorder: OutlineInputBorder( //<-- SEE HERE
                                                  borderSide: BorderSide(color: Colors.green.withOpacity(0.5), width: 2),
                                                ),
                                                focusedBorder: OutlineInputBorder( //<-- SEE HERE
                                                  borderSide: BorderSide(color: CustomColor.drawer_bg.withOpacity(0.5), width: 2),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                              ),
                                              dropdownColor: Colors.white,
                                              value: selectvillagealue,
                                              onChanged: (VillageResult? newValue) {
                                                setState(() {
                                                  selectvillagealue = newValue!;
                                                });

                                              },
                                              items: villagelist.map<DropdownMenuItem<VillageResult>>((VillageResult value) {
                                                return DropdownMenuItem<VillageResult>(
                                                  value: value,
                                                  child: Text(
                                                    value.VillageName??"",
                                                    style: TextStyle(fontSize: FontSize.sp_15),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                          Positioned(
                                            left: 10,
                                            top: 3,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: 3),
                                              color: Colors.white,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: 'Village',
                                                  style: TextStyle(color: Colors.black),
                                                  /*defining default style is optional */
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: ' *',
                                                        style: TextStyle(fontWeight: FontWeight.bold,color:  Colors.red)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.white, // Background color
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.green.withOpacity(0.5),
                                            // Elevation color
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText:
                                              'Population of Village (Census 2011)',
                                          labelText:
                                              'Population of Village (Census 2011)',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal:
                                                  5), // Adjust text padding
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter Population of Village (Census 2011)';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.white, // Background color
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.green.withOpacity(0.5),
                                            // Elevation color
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'SC Population of Village',
                                          labelText: 'SC Population of Villag',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal:
                                                  5), // Adjust text padding
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter SC Population of Village';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.white, // Background color
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.green.withOpacity(0.5),
                                            // Elevation color
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText:
                                              'No. of Households as on date',
                                          labelText:
                                              'No. of Households as on date',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal:
                                                  5), // Adjust text padding
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'No. of Households as on date';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.white, // Background color
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.green.withOpacity(0.5),
                                            // Elevation color
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText:
                                              'Currenlty Total Population of village/GP',
                                          labelText:
                                              'Currenlty Total Population of village/GP',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal:
                                                  5), // Adjust text padding
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Currenlty Total Population of village/GP';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.white, // Background color
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.green.withOpacity(0.5),
                                            // Elevation color
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText:
                                              'Currenlty SC Population of village/GP',
                                          labelText:
                                              'Currenlty SC Population of village/GP',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal:
                                                  5), // Adjust text padding
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Currenlty SC Population of village/GP';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            margin: EdgeInsets.only(top: 5),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              // Background color
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.green
                                                      .withOpacity(0.5),
                                                  // Elevation color
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                  offset: Offset(0,
                                                      1), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                hintText: 'From Date',
                                                labelText: 'From Date',
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal:
                                                            5), // Adjust text padding
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'From Date';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            margin: EdgeInsets.only(top: 5),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              // Background color
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.green
                                                      .withOpacity(0.5),
                                                  // Elevation color
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                  offset: Offset(0,
                                                      1), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                hintText: 'To Date',
                                                labelText: 'To Date',
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal:
                                                            5), // Adjust text padding
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'To Date';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: CustomColor.black_light, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5.0),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: CustomColor.theme_color1,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(5.0),
                                      topLeft: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0),
                                      bottomRight: Radius.circular(5.0)),
                                ),
                                child: Text(
                                  '2.GPS Data : GPS Coordinates of Village',
                                  style: TextStyle(
                                      fontSize: 18.00,
                                      color: CustomColor.white),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, bottom: 5),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          // Background color
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.green.withOpacity(0.5),
                                              // Elevation color
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                            ' Latitude: ${latitude.toString()}',
                                            style: TextStyle(
                                                fontSize: FontSize.sp_17,
                                                fontWeight: FontWeight.bold,
                                                color: CustomColor.black_dark)),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          margin: EdgeInsets.only(top: 5),
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            // Background color
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.green
                                                    .withOpacity(0.5),
                                                // Elevation color
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                                offset: Offset(0,
                                                    1), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Text(
                                              ' Longitude: ${longitude.toString()}',
                                              style: TextStyle(
                                                  fontSize: FontSize.sp_17,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      CustomColor.black_dark))),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: CustomColor.black_light, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5.0),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: CustomColor.theme_color1,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(5.0),
                                      topLeft: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0),
                                      bottomRight: Radius.circular(5.0)),
                                ),
                                child: ExpandableTextWidget(
                                  text:
                                      '3. Details of Village PMAGY Convergence Committee (Minimum 5 members should be in Village Level Convergence Committee (VLCC)) *',
                                  textStyle: TextStyle(
                                      fontSize: 18.00,
                                      color: CustomColor.white),
                                  maxLines: 4,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  margin: EdgeInsets.only(top: 5, right: 10),
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    // Change color as needed
                                    borderRadius: BorderRadius.circular(
                                        25.0), // Half of the width and height to make it circular
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(25.0),
                                    // Same as container to make the ripple effect circular
                                    onTap: () {
                                      addCommitteeDialog();
                                      // showDialog(
                                      //   context: context,
                                      //   builder: (BuildContext context) {
                                      //     return addCommitteeDialog();
                                      //   },
                                      // );
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              committeeListData.length==0?
                              Container(
                                decoration: BoxDecoration(
                                  color: CustomColor.patter_bg,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(5.0),
                                      topLeft: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0),
                                      bottomRight: Radius.circular(5.0)),
                                ),
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                textAlign: TextAlign.right,
                                                'Name',
                                                style: TextStyle(
                                                    fontFamily: 'Calibri',
                                                    color: CustomColor
                                                        .black_light,
                                                    fontSize: FontSize.sp_15,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              SizedBox(height: 5,),

                                              Text(
                                                textAlign: TextAlign.right,
                                                '---------',
                                                maxLines: 3,
                                                style: TextStyle(
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    fontFamily: 'Calibri',
                                                    color: CustomColor
                                                        .black_dark,
                                                    fontSize: FontSize.sp_15,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),

                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  textAlign: TextAlign.right,
                                                  'Designation',
                                                  style: TextStyle(
                                                      fontFamily: 'Calibri',
                                                      color: CustomColor
                                                          .black_light,
                                                      fontSize: FontSize.sp_15,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                SizedBox(height: 5,),
                                                Text(
                                                  textAlign: TextAlign.right,
                                                  '---------',
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      fontFamily: 'Calibri',
                                                      color: CustomColor
                                                          .black_dark,
                                                      fontSize: FontSize.sp_15,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),

                                              ],
                                            )
                                        ),


                                      ],
                                    ),
                                    dividerLine(),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                textAlign: TextAlign.right,
                                                'MobileNo',
                                                style: TextStyle(
                                                    fontFamily: 'Calibri',
                                                    color: CustomColor
                                                        .black_light,
                                                    fontSize: FontSize.sp_15,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),

                                              Text(
                                                textAlign: TextAlign.right,
                                                '---------',
                                                maxLines: 3,
                                                style: TextStyle(
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    fontFamily: 'Calibri',
                                                    color: CustomColor
                                                        .black_dark,
                                                    fontSize: FontSize.sp_15,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  textAlign: TextAlign.right,
                                                  'Email',
                                                  style: TextStyle(
                                                      fontFamily: 'Calibri',
                                                      color: CustomColor
                                                          .black_light,
                                                      fontSize: FontSize.sp_15,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),

                                                Text(
                                                  textAlign: TextAlign.right,
                                                  '---------',
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      fontFamily: 'Calibri',
                                                      color: CustomColor
                                                          .black_dark,
                                                      fontSize: FontSize.sp_15,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                )
                                              ],
                                            )
                                        ),


                                      ],
                                    ),
                                    dividerLine(),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                textAlign: TextAlign.right,
                                                'Address',
                                                style: TextStyle(
                                                    fontFamily: 'Calibri',
                                                    color: CustomColor
                                                        .black_light,
                                                    fontSize: FontSize.sp_15,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),

                                              Text(
                                                textAlign: TextAlign.right,
                                                '---------',
                                                maxLines: 3,
                                                style: TextStyle(
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    fontFamily: 'Calibri',
                                                    color: CustomColor
                                                        .black_dark,
                                                    fontSize: FontSize.sp_15,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  textAlign: TextAlign.right,
                                                  'Remark',
                                                  style: TextStyle(
                                                      fontFamily: 'Calibri',
                                                      color: CustomColor
                                                          .black_light,
                                                      fontSize: FontSize.sp_15,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),

                                                Text(
                                                  textAlign: TextAlign.right,
                                                  '---------',
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      fontFamily: 'Calibri',
                                                      color: CustomColor
                                                          .black_dark,
                                                      fontSize: FontSize.sp_15,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                )
                                              ],
                                            )
                                        ),


                                      ],
                                    ),
                                  ],
                                ),
                              ):ListView.builder(
                                shrinkWrap: true,
                                itemCount: committeeListData.length,
                                itemBuilder: (context, index) {
                                return  Container(
                                  decoration: BoxDecoration(
                                    color: CustomColor.patter_bg,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(5.0),
                                        topLeft: Radius.circular(5.0),
                                        bottomLeft: Radius.circular(5.0),
                                        bottomRight: Radius.circular(5.0)),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(5),
                                    child: Stack(
                                      children: <Widget>[
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        textAlign: TextAlign.right,
                                                        'Name',
                                                        style: TextStyle(
                                                            fontFamily: 'Calibri',
                                                            color: CustomColor
                                                                .black_light,
                                                            fontSize: FontSize.sp_15,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                      SizedBox(height: 5,),
                                                      Text(
                                                        textAlign: TextAlign.right,
                                                        committeeListData[index]?.Name??"",
                                                        maxLines: 3,
                                                        style: TextStyle(
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            fontFamily: 'Calibri',
                                                            color: CustomColor
                                                                .black_dark,
                                                            fontSize: FontSize.sp_15,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          textAlign: TextAlign.right,
                                                          'Designation',
                                                          style: TextStyle(
                                                              fontFamily: 'Calibri',
                                                              color: CustomColor
                                                                  .black_light,
                                                              fontSize: FontSize.sp_15,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ),
                                                        SizedBox(height: 5,),
                                                        Text(
                                                          textAlign: TextAlign.right,
                                                          committeeListData[index]!.Designation??"",
                                                          maxLines: 3,
                                                          style: TextStyle(
                                                              overflow:
                                                              TextOverflow.ellipsis,
                                                              fontFamily: 'Calibri',
                                                              color: CustomColor
                                                                  .black_dark,
                                                              fontSize: FontSize.sp_15,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ),

                                                      ],
                                                    )
                                                ),


                                              ],
                                            ),
                                            dividerLine(),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        textAlign: TextAlign.right,
                                                        'MobileNo',
                                                        style: TextStyle(
                                                            fontFamily: 'Calibri',
                                                            color: CustomColor
                                                                .black_light,
                                                            fontSize: FontSize.sp_15,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),

                                                      Text(
                                                        textAlign: TextAlign.right,
                                                        committeeListData[index]!.MobileNo??"",
                                                        maxLines: 3,
                                                        style: TextStyle(
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            fontFamily: 'Calibri',
                                                            color: CustomColor
                                                                .black_dark,
                                                            fontSize: FontSize.sp_15,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          textAlign: TextAlign.right,
                                                          'Email',
                                                          style: TextStyle(
                                                              fontFamily: 'Calibri',
                                                              color: CustomColor
                                                                  .black_light,
                                                              fontSize: FontSize.sp_15,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ),

                                                        Text(
                                                          textAlign: TextAlign.right,
                                                          committeeListData[index]!.Email??"",
                                                          maxLines: 3,
                                                          style: TextStyle(
                                                              overflow:
                                                              TextOverflow.ellipsis,
                                                              fontFamily: 'Calibri',
                                                              color: CustomColor
                                                                  .black_dark,
                                                              fontSize: FontSize.sp_15,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        )
                                                      ],
                                                    )
                                                ),


                                              ],
                                            ),
                                            dividerLine(),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        textAlign: TextAlign.right,
                                                        'Address',
                                                        style: TextStyle(
                                                            fontFamily: 'Calibri',
                                                            color: CustomColor
                                                                .black_light,
                                                            fontSize: FontSize.sp_15,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),

                                                      Text(
                                                        textAlign: TextAlign.right,
                                                        committeeListData[index]!.Address??"",
                                                        maxLines: 3,
                                                        style: TextStyle(
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            fontFamily: 'Calibri',
                                                            color: CustomColor
                                                                .black_dark,
                                                            fontSize: FontSize.sp_15,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          textAlign: TextAlign.right,
                                                          'Remark',
                                                          style: TextStyle(
                                                              fontFamily: 'Calibri',
                                                              color: CustomColor
                                                                  .black_light,
                                                              fontSize: FontSize.sp_15,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ),

                                                        Text(
                                                          textAlign: TextAlign.right,
                                                          committeeListData[index]!.Remark??"",
                                                          maxLines: 3,
                                                          style: TextStyle(
                                                              overflow:
                                                              TextOverflow.ellipsis,
                                                              fontFamily: 'Calibri',
                                                              color: CustomColor
                                                                  .black_dark,
                                                              fontSize: FontSize.sp_15,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        )
                                                      ],
                                                    )
                                                ),


                                              ],
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          right: 5,
                                          top: 3,
                                          child: Container(
                                            margin: EdgeInsets.only(top: 5, right: 10),
                                            width: 25.0,
                                            height: 25.0,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              // Change color as needed
                                              borderRadius: BorderRadius.circular(
                                                  25.0), // Half of the width and height to make it circular
                                            ),
                                            child: InkWell(
                                              borderRadius: BorderRadius.circular(25.0),
                                              // Same as container to make the ripple effect circular
                                              onTap: () {

                                                committeeListData.removeAt(index);
                                                setState(() {

                                                });
                                              },
                                              child: Center(child: Text('X',style: TextStyle(fontSize: FontSize.sp_18,color:  Colors.white,fontWeight: FontWeight.bold),)),
                                            ),
                                          ),
                                        ),



                                      ],
                                    ),
                                  );


                                },
                              )
                            ],
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: ElevatedButton(
                            child: Text('Submit',
                                style: TextStyle(
                                    fontSize: FontSize.sp_17,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColor.white)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a Snackbar.
                                // Scaffold.of(context).showSnackBar(SnackBar(content: Text('Data is in processing.')));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColor.theme_color1,
                              padding: EdgeInsets.only(left: 20, right: 20),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
  Future<void> addCommitteeDialog() async
  {
    showDialog(
      context: context,
      builder: (context) {

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Add Convergence Committee'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.5),
                            // Elevation color
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: name,
                        decoration: const InputDecoration(
                          hintText: 'Enter your Name',
                          labelText: 'Name',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5), // Adjust text padding
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only( top: 9),
                            height: 65,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder( //<-- SEE HERE
                                  borderSide: BorderSide(color: Colors.green.withOpacity(0.5), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder( //<-- SEE HERE
                                  borderSide: BorderSide(color: CustomColor.drawer_bg.withOpacity(0.5), width: 2),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              dropdownColor: Colors.white,
                              value: designationvalue,
                              onChanged: (DesignationResult? newValue) {
                                setState(() {

                                  designationvalue = newValue!;
                                });

                                if (designationvalue.Designation != '---Select Designation---')
                                {

                                }
                                // designationlist
                                // designationvalue

                              },
                              items: designationlist.map<DropdownMenuItem<DesignationResult>>((DesignationResult value) {
                                return DropdownMenuItem<DesignationResult>(
                                  value: value,
                                  child: Text(
                                    value.Designation??"",
                                    style: TextStyle(fontSize: FontSize.sp_15),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Positioned(
                            left: 10,
                            top: 3,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 3),
                              color: Colors.white,
                              child: RichText(
                                text: TextSpan(
                                  text: '---Select Designation---',
                                  style: TextStyle(color: Colors.black),
                                  /*defining default style is optional */
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' *',
                                        style: TextStyle(fontWeight: FontWeight.bold,color:  Colors.red)),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.5),
                            // Elevation color
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: mobileno,
                        decoration: const InputDecoration(
                          hintText: 'Enter your Mobile No.',
                          labelText: 'Mobile No.',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5), // Adjust text padding
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.5),
                            // Elevation color
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: emailid,
                        decoration: const InputDecoration(
                          hintText: 'Enter your Email.',
                          labelText: 'Email',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5), // Adjust text padding
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.5),
                            // Elevation color
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: address,
                        decoration: const InputDecoration(
                          hintText: 'Enter your Address.',
                          labelText: 'Address',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5), // Adjust text padding
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.5),
                            // Elevation color
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: remark,
                        decoration: const InputDecoration(
                          hintText: 'Enter your Remark.',
                          labelText: 'Remark',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5), // Adjust text padding
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // addCommittee.Name=name.text;
                    // addCommittee.Designation=select_designation;
                    // addCommittee.MobileNo=mobileno.text;
                    // addCommittee.Email=emailid.text;
                    // addCommittee.Address=address.text;
                    // addCommittee.Remark=remark.text;
                    var saveData = AddCommittee(
                        Name: name.text,
                        Designation: select_designation,
                        MobileNo: mobileno.text,
                        Email: emailid.text,
                        Address: address.text,
                        Remark: remark.text);
                    committeeListData.add(saveData);

                    setState(() {

                    });
                    //  Provider.of<PmajayVM>(context, listen: false).setAddCommitteeList = data_list;
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );

  }
}

