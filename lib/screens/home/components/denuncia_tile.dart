import 'package:covid_alert/screens/denuncia_details/denuncia_details_screen.dart';
import 'package:covid_alert/shared/models/denuncia.dart';
import 'package:covid_alert/shared/utils/parse_horary.dart';
import 'package:flutter/material.dart';

class DenunciaTile extends StatelessWidget {
  final Denuncia denuncia;

  const DenunciaTile({Key key, this.denuncia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17.0),
      child: Row(
        children: <Widget>[
          Text(
            parseHorary(denuncia.dateTime),
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 8),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        blurRadius: 10,
                        offset: Offset(2, 3))
                  ]),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DenunciaDetails(denuncia: denuncia),
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              renderField(
                                  title: "Endereço", content: denuncia.address),
                              renderField(
                                  title: "Categoria",
                                  content: denuncia.event,
                                  contentIsBold: true,
                                  colorContent: Colors.red),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  renderField(
      {String title,
      String content,
      Color colorContent,
      contentIsBold: false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "$title: ",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
        Expanded(
            child: Text(
          content,
          style: TextStyle(
              color: colorContent,
              fontSize: 13,
              fontWeight: contentIsBold ? FontWeight.bold : null),
        )),
      ],
    );
  }
}
