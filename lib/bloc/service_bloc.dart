import 'dart:async';

/**
    @Author: Islomkhuja Akhrorov
    Created at:
 **/
import 'package:mobiuz/bloc/base/base_bloc.dart';
import 'package:mobiuz/model/service.dart';

class ServiceBloc extends BaseBloc {
  final _services = StreamController<List<Service>>();

  Stream<List<Service>> get services => _services.stream;

  void getServices() {
    _services.sink.add(<Service>[
      Service(
          titleUz: "4G LTE",
          titleRu: "4G LTE",
          descrRu: """
      4G LTE в г. Ташкенте и г. Самарканде! Интернет UMS на 4G LTE скоростях без лишних затрат! Скорость до 70 Мбит/с. UMS предлагает интернет 4-го поколения - 4G LTE по цене 3G! 4G LTE доступен на всех современных устройствах с 4G-модулем: смартфонах, планшетах, роутерах, модемах.
      """,
          descrUz: """
4G LTE Toshkent shahrining har bir qismida va Samarqand shahrida!  70 Mbit/sgacha tezlik. 4G LTEni 3G narxida taklif etadi! 4G LTE 4G-modulga ega barcha zamonaviy qurilmalarda.
        """,
          codeApply: "tel://*222*1#",
          codeDeny: "tel://*222*0#"),
      Service(
          titleUz: "AntiAON",
          titleRu: "АнтиАОН",
          descrRu: """
      Услуга Антиопределитель номера позволяет абоненту запретить или разрешить определение своего телефонного номера при исходящих звонках на любые телефонные номера абонентов UMS. Запрет на определение номеров при исходящем вызове на телефоны абонентов других сетей, в том числе городских сетей общего пользования, не гарантируется.
       """,
          descrUz: """
Raqamnianiqlashga qarshilik xizmatiimkonini beradiabonentga istalgan UMS abonenti telefon raqamiga chiquvchi qo‘ng‘iroqlarda o‘z tеlеfon raqamini aniqlashni taqiqlash yoki ruxsat berish imkonini beradi. Boshqa tarmoqlar abonеntlariga, jumladan, umumiy foydalanishdagi chiquvchi qo‘ng‘iroqlarda raqamni aniqlashni taqiqlashni kafolatlanmaydi.
     """,
          codeApply: "tel://*111*0101#",
          codeSet: "tel://*111*0100#"),
      Service(
          titleUz: "Chaqiriqni kutish va ushlabturish",
          titleRu: "Ожидание и удержание вызова",
          descrRu: """
    Режим ожидания вызова позволяет в процессе разговора с другим абонентом ответить на входящий звонок (либо позвонить другому абоненту) и удержать поступивший вызов до завершения текущего разговора, то есть поочерёдно разговаривать с двумя абонентами.
    """,
          descrUz: """
Suhbat mobaynida javob berish jarayonida boshqa abonent kirish qo‘ng‘iroqlari (yoki qo‘ng‘iroq qilgan boshqaabonent) Chaqiriqni kutish rejimi imkonini beradi va kirish chaqiriqlarini mazkur joriy suhbat tugagunigaqada rushlabturadi, ya’ninavbatma-navba tikki abonеnt bilan suhbatlashadi.      """,
          codeApply: "tel://*43#",
          codeDeny: "tel://*43#"),
      Service(
          titleUz: "Va’da qilingan to‘lov",
          titleRu: "Обещанный платеж",
          descrRu: """
      Данная услуга позволяет получить на свой счет \$3 для дальнейшего использования на услуги связи в счет будущей оплаты, сроком на 3 дня. Данная услуга доступна абонентам даже при нахождении абонента в блокированном статусе (отсутствие предоплаты) при балансе больше -2\$ (минус два). Стоимость активации услуги \$0,5
      """,
          descrUz: """
          Ushbu xizmat kelgusida to‘lanadigan mablag‘ hisobidan aloqa xizmatlaridan foydalanishni davom ettirish uchun o‘z hisobvarag‘ingizga 3 kun muddatga 3 \$ tushirish imkonini beradi. Ushbu xizmat hatto bloklangan holatda (oldindan to'lovi yoq), -2\$ (minus ikki) dan ortiq balansida abonentlarga amal qiladi. Xizmatni faollashtirish narxi 0,5 \$
        """,
          codeApply: "tel://*111*32#",
          codeSet: "tel://*111*320#"),
      Service(
        titleUz: "«Menga qo’ng’iroq qil!»",
        titleRu: "Перезвони мне!",
        descrRu: """
     Данная услуга позволяет быстро и легко отправить запрос с просьбой перезвонить абоненту любого оператора сотовой связи Узбекистана и МТС-Россия .
      """,
        descrUz: """
Ushbu xizmat O’zbekistonning barcha uyali aloqa operatorlari va MTS-Rossiya abonentlariga ular qo’ng’iroq qilishlarini iltimos qilib, tez va oson so’rov yuborish imkonini beradi.
        """,
        codeApply: "tel://*110*998900000000#",
      ),
      Service(
        titleUz: "Bir martalik AntiAON",
        titleRu: "«Разовый АнтиАОН»",
        descrRu: """
     Услуга «Разовый АнтиАОН» предоставляет вам возможность скрыть свой номер для вызываемого абонента. Данный сервис предоставляется разово и не требует специального подключения.
     """,
        descrUz: """
«Bir martalik AntiAON» xizmati sizga chaqirilayotgan abonentga o‘z raqamingizni ko‘rsatmaslik imkonini beradi. Ushbu servis bir marta taqdim etiladi va buning uchun uni maxsus ulash shart emas.
     """,
        codeApply: "tel://#998900000000",
      ),
    ]);
  }

  @override
  void dispose() {
    _services.close();
  }
}
