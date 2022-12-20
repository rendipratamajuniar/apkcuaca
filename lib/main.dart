import 'package:flutter/material.dart';
import 'package:apkcuaca/cubit/cuaca_cubit.dart';
import 'package:apkcuaca/model/cuaca_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController controller = TextEditingController();
  DataService dataService = DataService();
  CuacaModel cuaca = CuacaModel();
  bool isFetch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('191011450274 - RENDI PRATAMA JUNIAR'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 250,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: controller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        labelText: 'Masukan Nama Kota',
                        border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0))),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      isFetch = true;
                      cuaca = await dataService.fetchData(controller.text);
                      setState(() {});
                    },
                    child: Text('Cari')),
              ],
            ),
             Padding(
            padding: const EdgeInsets.symmetric(vertical: 30)),
            isFetch
                ? Column(
                    children: [
                      Text(
                        'cuaca.name',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Image.network(
                          'http://openweathermap.org/img/wn/${cuaca.icon}@2x.png'),
                      Text(
                        'cuaca.description',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  )
                : SizedBox(),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18)),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                isFetch
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Suhu',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            '${cuaca.temp}° Celcius',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      )
                    : SizedBox(),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),),
                isFetch
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Kecepatan angin',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            '${cuaca.speed} Km',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      )
                    : SizedBox(),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),),
                isFetch
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Latitude',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            '${cuaca.lat}',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      )
                    : SizedBox(),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),),
                isFetch
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Longitude',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            '${cuaca.lon}',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      )
                    : SizedBox(),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 216, 216, 216),
    );
  }
}
