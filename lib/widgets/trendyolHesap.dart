import 'dart:ffi';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dart:math';

List<String> kdv = ['', '%1', '%8', '18'];

class trendyolHesap extends StatefulWidget {
  const trendyolHesap({Key? key}) : super(key: key);

  @override
  State<trendyolHesap> createState() => _trendyolHesapState();
}

class _trendyolHesapState extends State<trendyolHesap> {
  final _formKey = GlobalKey<FormState>();

  String? selectedKdv = null;
  TextEditingController komisyonController = TextEditingController();
  TextEditingController alisController = TextEditingController();
  TextEditingController satisController = TextEditingController();
  TextEditingController kargoController = TextEditingController();

  bool kargoVisibilty = false;

  @override
  Widget build(BuildContext context) {
    var selectedKdv;
    String? kargoTercihi = null;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          height: 600,
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: komisyonController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                maxLength: 2,

                ///max 2 digit only int keyboard type is number///
                decoration: const InputDecoration(
                  label: Text('Komisyon %'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'komisyon tutarı girilmelidir';
                  }
                  ;
                  if (int.parse(value) >= 100 || int.parse(value) <= 0) {
                    return 'komisyon %1 ile %99 arasında bir tutar olmalıdır';
                  }
                },
              ),
              DropdownButton(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                isExpanded: true,
                hint: Text('KDV %'),
                borderRadius: BorderRadius.circular(20),
                value: selectedKdv,
                onChanged: (value) {
                  setState(() {
                    selectedKdv = value!;

                    ///secilen value ekrana yansımıyor
                  });
                },
                items: kdv.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value == '' ? 'Kdv tutarı seciniz' : value),
                  );
                }).toList(),
              ),
              TextFormField(
                controller: alisController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                maxLength: 5,

                ///max 5 digit only int keyboard type is number///
                decoration: const InputDecoration(
                  label: Text('Alış Fiyatı'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alış Fiyatı Girilmelidir';
                  }
                },
              ),
              TextFormField(
                controller: satisController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                maxLength: 5,

                ///max 5 digit only int keyboard type is number///
                decoration: const InputDecoration(
                  label: Text('Satış Fiyatı  (KDV Dahil)'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Satış Fiyatı Girilmelidir';
                  }
                },
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile(
                      title: const Text('Kargo Alıcıya Ait'),
                      value: 'Kargo Alıcıya Ait',
                      groupValue: kargoTercihi,
                      onChanged: (value) {
                        setState(() {
                          kargoTercihi = value.toString();
                          print(value);
                          if (kargoTercihi == value) {
                            kargoVisibilty = false;
                          }
                        });
                      }),
                  RadioListTile(
                      title: const Text('Kargo Satıcıya Ait'),
                      value: 'Kargo Satıcıya Ait',
                      groupValue: kargoTercihi,
                      onChanged: (value) {
                        setState(() {
                          kargoTercihi = value.toString();
                          print(value);
                          if (kargoTercihi == value) {
                            kargoVisibilty = true;
                          }
                        });
                      }),
                ],
              ),
              Visibility(
                visible: kargoVisibilty,
                child: TextFormField(
                  controller: kargoController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  maxLength: 5,

                  ///max 5 digit only int keyboard type is number///
                  decoration: const InputDecoration(
                    label: Text('Kargo Ücreti'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kargo Ücreti Girilmelidir';
                    }
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  print(alisController.text);
                  print(satisController.text);
                  print(komisyonController.text);
                  print(kargoController.text);
                },
                child: Text('Hesapla'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
