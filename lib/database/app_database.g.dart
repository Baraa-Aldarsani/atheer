// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SurahsTableTable extends SurahsTable
    with TableInfo<$SurahsTableTable, SurahsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SurahsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
    'number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _englishNameMeta = const VerificationMeta(
    'englishName',
  );
  @override
  late final GeneratedColumn<String> englishName = GeneratedColumn<String>(
    'english_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _englishNameTranslationMeta =
      const VerificationMeta('englishNameTranslation');
  @override
  late final GeneratedColumn<String> englishNameTranslation =
      GeneratedColumn<String>(
        'english_name_translation',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _numberOfAyahsMeta = const VerificationMeta(
    'numberOfAyahs',
  );
  @override
  late final GeneratedColumn<int> numberOfAyahs = GeneratedColumn<int>(
    'number_of_ayahs',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _revelationTypeMeta = const VerificationMeta(
    'revelationType',
  );
  @override
  late final GeneratedColumn<String> revelationType = GeneratedColumn<String>(
    'revelation_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    number,
    name,
    englishName,
    englishNameTranslation,
    numberOfAyahs,
    revelationType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'surahs_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SurahsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('english_name')) {
      context.handle(
        _englishNameMeta,
        englishName.isAcceptableOrUnknown(
          data['english_name']!,
          _englishNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_englishNameMeta);
    }
    if (data.containsKey('english_name_translation')) {
      context.handle(
        _englishNameTranslationMeta,
        englishNameTranslation.isAcceptableOrUnknown(
          data['english_name_translation']!,
          _englishNameTranslationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_englishNameTranslationMeta);
    }
    if (data.containsKey('number_of_ayahs')) {
      context.handle(
        _numberOfAyahsMeta,
        numberOfAyahs.isAcceptableOrUnknown(
          data['number_of_ayahs']!,
          _numberOfAyahsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_numberOfAyahsMeta);
    }
    if (data.containsKey('revelation_type')) {
      context.handle(
        _revelationTypeMeta,
        revelationType.isAcceptableOrUnknown(
          data['revelation_type']!,
          _revelationTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_revelationTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {number};
  @override
  SurahsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SurahsTableData(
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      englishName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}english_name'],
      )!,
      englishNameTranslation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}english_name_translation'],
      )!,
      numberOfAyahs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number_of_ayahs'],
      )!,
      revelationType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}revelation_type'],
      )!,
    );
  }

  @override
  $SurahsTableTable createAlias(String alias) {
    return $SurahsTableTable(attachedDatabase, alias);
  }
}

class SurahsTableData extends DataClass implements Insertable<SurahsTableData> {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final int numberOfAyahs;
  final String revelationType;
  const SurahsTableData({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.numberOfAyahs,
    required this.revelationType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['number'] = Variable<int>(number);
    map['name'] = Variable<String>(name);
    map['english_name'] = Variable<String>(englishName);
    map['english_name_translation'] = Variable<String>(englishNameTranslation);
    map['number_of_ayahs'] = Variable<int>(numberOfAyahs);
    map['revelation_type'] = Variable<String>(revelationType);
    return map;
  }

  SurahsTableCompanion toCompanion(bool nullToAbsent) {
    return SurahsTableCompanion(
      number: Value(number),
      name: Value(name),
      englishName: Value(englishName),
      englishNameTranslation: Value(englishNameTranslation),
      numberOfAyahs: Value(numberOfAyahs),
      revelationType: Value(revelationType),
    );
  }

  factory SurahsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SurahsTableData(
      number: serializer.fromJson<int>(json['number']),
      name: serializer.fromJson<String>(json['name']),
      englishName: serializer.fromJson<String>(json['englishName']),
      englishNameTranslation: serializer.fromJson<String>(
        json['englishNameTranslation'],
      ),
      numberOfAyahs: serializer.fromJson<int>(json['numberOfAyahs']),
      revelationType: serializer.fromJson<String>(json['revelationType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'number': serializer.toJson<int>(number),
      'name': serializer.toJson<String>(name),
      'englishName': serializer.toJson<String>(englishName),
      'englishNameTranslation': serializer.toJson<String>(
        englishNameTranslation,
      ),
      'numberOfAyahs': serializer.toJson<int>(numberOfAyahs),
      'revelationType': serializer.toJson<String>(revelationType),
    };
  }

  SurahsTableData copyWith({
    int? number,
    String? name,
    String? englishName,
    String? englishNameTranslation,
    int? numberOfAyahs,
    String? revelationType,
  }) => SurahsTableData(
    number: number ?? this.number,
    name: name ?? this.name,
    englishName: englishName ?? this.englishName,
    englishNameTranslation:
        englishNameTranslation ?? this.englishNameTranslation,
    numberOfAyahs: numberOfAyahs ?? this.numberOfAyahs,
    revelationType: revelationType ?? this.revelationType,
  );
  SurahsTableData copyWithCompanion(SurahsTableCompanion data) {
    return SurahsTableData(
      number: data.number.present ? data.number.value : this.number,
      name: data.name.present ? data.name.value : this.name,
      englishName: data.englishName.present
          ? data.englishName.value
          : this.englishName,
      englishNameTranslation: data.englishNameTranslation.present
          ? data.englishNameTranslation.value
          : this.englishNameTranslation,
      numberOfAyahs: data.numberOfAyahs.present
          ? data.numberOfAyahs.value
          : this.numberOfAyahs,
      revelationType: data.revelationType.present
          ? data.revelationType.value
          : this.revelationType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SurahsTableData(')
          ..write('number: $number, ')
          ..write('name: $name, ')
          ..write('englishName: $englishName, ')
          ..write('englishNameTranslation: $englishNameTranslation, ')
          ..write('numberOfAyahs: $numberOfAyahs, ')
          ..write('revelationType: $revelationType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    number,
    name,
    englishName,
    englishNameTranslation,
    numberOfAyahs,
    revelationType,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SurahsTableData &&
          other.number == this.number &&
          other.name == this.name &&
          other.englishName == this.englishName &&
          other.englishNameTranslation == this.englishNameTranslation &&
          other.numberOfAyahs == this.numberOfAyahs &&
          other.revelationType == this.revelationType);
}

class SurahsTableCompanion extends UpdateCompanion<SurahsTableData> {
  final Value<int> number;
  final Value<String> name;
  final Value<String> englishName;
  final Value<String> englishNameTranslation;
  final Value<int> numberOfAyahs;
  final Value<String> revelationType;
  const SurahsTableCompanion({
    this.number = const Value.absent(),
    this.name = const Value.absent(),
    this.englishName = const Value.absent(),
    this.englishNameTranslation = const Value.absent(),
    this.numberOfAyahs = const Value.absent(),
    this.revelationType = const Value.absent(),
  });
  SurahsTableCompanion.insert({
    this.number = const Value.absent(),
    required String name,
    required String englishName,
    required String englishNameTranslation,
    required int numberOfAyahs,
    required String revelationType,
  }) : name = Value(name),
       englishName = Value(englishName),
       englishNameTranslation = Value(englishNameTranslation),
       numberOfAyahs = Value(numberOfAyahs),
       revelationType = Value(revelationType);
  static Insertable<SurahsTableData> custom({
    Expression<int>? number,
    Expression<String>? name,
    Expression<String>? englishName,
    Expression<String>? englishNameTranslation,
    Expression<int>? numberOfAyahs,
    Expression<String>? revelationType,
  }) {
    return RawValuesInsertable({
      if (number != null) 'number': number,
      if (name != null) 'name': name,
      if (englishName != null) 'english_name': englishName,
      if (englishNameTranslation != null)
        'english_name_translation': englishNameTranslation,
      if (numberOfAyahs != null) 'number_of_ayahs': numberOfAyahs,
      if (revelationType != null) 'revelation_type': revelationType,
    });
  }

  SurahsTableCompanion copyWith({
    Value<int>? number,
    Value<String>? name,
    Value<String>? englishName,
    Value<String>? englishNameTranslation,
    Value<int>? numberOfAyahs,
    Value<String>? revelationType,
  }) {
    return SurahsTableCompanion(
      number: number ?? this.number,
      name: name ?? this.name,
      englishName: englishName ?? this.englishName,
      englishNameTranslation:
          englishNameTranslation ?? this.englishNameTranslation,
      numberOfAyahs: numberOfAyahs ?? this.numberOfAyahs,
      revelationType: revelationType ?? this.revelationType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (englishName.present) {
      map['english_name'] = Variable<String>(englishName.value);
    }
    if (englishNameTranslation.present) {
      map['english_name_translation'] = Variable<String>(
        englishNameTranslation.value,
      );
    }
    if (numberOfAyahs.present) {
      map['number_of_ayahs'] = Variable<int>(numberOfAyahs.value);
    }
    if (revelationType.present) {
      map['revelation_type'] = Variable<String>(revelationType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SurahsTableCompanion(')
          ..write('number: $number, ')
          ..write('name: $name, ')
          ..write('englishName: $englishName, ')
          ..write('englishNameTranslation: $englishNameTranslation, ')
          ..write('numberOfAyahs: $numberOfAyahs, ')
          ..write('revelationType: $revelationType')
          ..write(')'))
        .toString();
  }
}

class $AyahsTableTable extends AyahsTable
    with TableInfo<$AyahsTableTable, AyahEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AyahsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
    'number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ayahTextMeta = const VerificationMeta(
    'ayahText',
  );
  @override
  late final GeneratedColumn<String> ayahText = GeneratedColumn<String>(
    'ayah_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ayahTextUthmaniMeta = const VerificationMeta(
    'ayahTextUthmani',
  );
  @override
  late final GeneratedColumn<String> ayahTextUthmani = GeneratedColumn<String>(
    'text_uthmani',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _surahNumberMeta = const VerificationMeta(
    'surahNumber',
  );
  @override
  late final GeneratedColumn<int> surahNumber = GeneratedColumn<int>(
    'surah_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numberInSurahMeta = const VerificationMeta(
    'numberInSurah',
  );
  @override
  late final GeneratedColumn<int> numberInSurah = GeneratedColumn<int>(
    'number_in_surah',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _juzMeta = const VerificationMeta('juz');
  @override
  late final GeneratedColumn<int> juz = GeneratedColumn<int>(
    'juz',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _manzilMeta = const VerificationMeta('manzil');
  @override
  late final GeneratedColumn<int> manzil = GeneratedColumn<int>(
    'manzil',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pageMeta = const VerificationMeta('page');
  @override
  late final GeneratedColumn<int> page = GeneratedColumn<int>(
    'page',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rukuMeta = const VerificationMeta('ruku');
  @override
  late final GeneratedColumn<int> ruku = GeneratedColumn<int>(
    'ruku',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hizbQuarterMeta = const VerificationMeta(
    'hizbQuarter',
  );
  @override
  late final GeneratedColumn<int> hizbQuarter = GeneratedColumn<int>(
    'hizb_quarter',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    number,
    ayahText,
    ayahTextUthmani,
    surahNumber,
    numberInSurah,
    juz,
    manzil,
    page,
    ruku,
    hizbQuarter,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ayahs_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AyahEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    }
    if (data.containsKey('ayah_text')) {
      context.handle(
        _ayahTextMeta,
        ayahText.isAcceptableOrUnknown(data['ayah_text']!, _ayahTextMeta),
      );
    } else if (isInserting) {
      context.missing(_ayahTextMeta);
    }
    if (data.containsKey('text_uthmani')) {
      context.handle(
        _ayahTextUthmaniMeta,
        ayahTextUthmani.isAcceptableOrUnknown(
          data['text_uthmani']!,
          _ayahTextUthmaniMeta,
        ),
      );
    }
    if (data.containsKey('surah_number')) {
      context.handle(
        _surahNumberMeta,
        surahNumber.isAcceptableOrUnknown(
          data['surah_number']!,
          _surahNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_surahNumberMeta);
    }
    if (data.containsKey('number_in_surah')) {
      context.handle(
        _numberInSurahMeta,
        numberInSurah.isAcceptableOrUnknown(
          data['number_in_surah']!,
          _numberInSurahMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_numberInSurahMeta);
    }
    if (data.containsKey('juz')) {
      context.handle(
        _juzMeta,
        juz.isAcceptableOrUnknown(data['juz']!, _juzMeta),
      );
    } else if (isInserting) {
      context.missing(_juzMeta);
    }
    if (data.containsKey('manzil')) {
      context.handle(
        _manzilMeta,
        manzil.isAcceptableOrUnknown(data['manzil']!, _manzilMeta),
      );
    } else if (isInserting) {
      context.missing(_manzilMeta);
    }
    if (data.containsKey('page')) {
      context.handle(
        _pageMeta,
        page.isAcceptableOrUnknown(data['page']!, _pageMeta),
      );
    } else if (isInserting) {
      context.missing(_pageMeta);
    }
    if (data.containsKey('ruku')) {
      context.handle(
        _rukuMeta,
        ruku.isAcceptableOrUnknown(data['ruku']!, _rukuMeta),
      );
    } else if (isInserting) {
      context.missing(_rukuMeta);
    }
    if (data.containsKey('hizb_quarter')) {
      context.handle(
        _hizbQuarterMeta,
        hizbQuarter.isAcceptableOrUnknown(
          data['hizb_quarter']!,
          _hizbQuarterMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hizbQuarterMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {number};
  @override
  AyahEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AyahEntry(
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number'],
      )!,
      ayahText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ayah_text'],
      )!,
      ayahTextUthmani: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text_uthmani'],
      ),
      surahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surah_number'],
      )!,
      numberInSurah: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number_in_surah'],
      )!,
      juz: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}juz'],
      )!,
      manzil: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}manzil'],
      )!,
      page: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page'],
      )!,
      ruku: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ruku'],
      )!,
      hizbQuarter: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hizb_quarter'],
      )!,
    );
  }

  @override
  $AyahsTableTable createAlias(String alias) {
    return $AyahsTableTable(attachedDatabase, alias);
  }
}

class AyahEntry extends DataClass implements Insertable<AyahEntry> {
  final int number;
  final String ayahText;
  final String? ayahTextUthmani;
  final int surahNumber;
  final int numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int ruku;
  final int hizbQuarter;
  const AyahEntry({
    required this.number,
    required this.ayahText,
    this.ayahTextUthmani,
    required this.surahNumber,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['number'] = Variable<int>(number);
    map['ayah_text'] = Variable<String>(ayahText);
    if (!nullToAbsent || ayahTextUthmani != null) {
      map['text_uthmani'] = Variable<String>(ayahTextUthmani);
    }
    map['surah_number'] = Variable<int>(surahNumber);
    map['number_in_surah'] = Variable<int>(numberInSurah);
    map['juz'] = Variable<int>(juz);
    map['manzil'] = Variable<int>(manzil);
    map['page'] = Variable<int>(page);
    map['ruku'] = Variable<int>(ruku);
    map['hizb_quarter'] = Variable<int>(hizbQuarter);
    return map;
  }

  AyahsTableCompanion toCompanion(bool nullToAbsent) {
    return AyahsTableCompanion(
      number: Value(number),
      ayahText: Value(ayahText),
      ayahTextUthmani: ayahTextUthmani == null && nullToAbsent
          ? const Value.absent()
          : Value(ayahTextUthmani),
      surahNumber: Value(surahNumber),
      numberInSurah: Value(numberInSurah),
      juz: Value(juz),
      manzil: Value(manzil),
      page: Value(page),
      ruku: Value(ruku),
      hizbQuarter: Value(hizbQuarter),
    );
  }

  factory AyahEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AyahEntry(
      number: serializer.fromJson<int>(json['number']),
      ayahText: serializer.fromJson<String>(json['ayahText']),
      ayahTextUthmani: serializer.fromJson<String?>(json['ayahTextUthmani']),
      surahNumber: serializer.fromJson<int>(json['surahNumber']),
      numberInSurah: serializer.fromJson<int>(json['numberInSurah']),
      juz: serializer.fromJson<int>(json['juz']),
      manzil: serializer.fromJson<int>(json['manzil']),
      page: serializer.fromJson<int>(json['page']),
      ruku: serializer.fromJson<int>(json['ruku']),
      hizbQuarter: serializer.fromJson<int>(json['hizbQuarter']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'number': serializer.toJson<int>(number),
      'ayahText': serializer.toJson<String>(ayahText),
      'ayahTextUthmani': serializer.toJson<String?>(ayahTextUthmani),
      'surahNumber': serializer.toJson<int>(surahNumber),
      'numberInSurah': serializer.toJson<int>(numberInSurah),
      'juz': serializer.toJson<int>(juz),
      'manzil': serializer.toJson<int>(manzil),
      'page': serializer.toJson<int>(page),
      'ruku': serializer.toJson<int>(ruku),
      'hizbQuarter': serializer.toJson<int>(hizbQuarter),
    };
  }

  AyahEntry copyWith({
    int? number,
    String? ayahText,
    Value<String?> ayahTextUthmani = const Value.absent(),
    int? surahNumber,
    int? numberInSurah,
    int? juz,
    int? manzil,
    int? page,
    int? ruku,
    int? hizbQuarter,
  }) => AyahEntry(
    number: number ?? this.number,
    ayahText: ayahText ?? this.ayahText,
    ayahTextUthmani: ayahTextUthmani.present
        ? ayahTextUthmani.value
        : this.ayahTextUthmani,
    surahNumber: surahNumber ?? this.surahNumber,
    numberInSurah: numberInSurah ?? this.numberInSurah,
    juz: juz ?? this.juz,
    manzil: manzil ?? this.manzil,
    page: page ?? this.page,
    ruku: ruku ?? this.ruku,
    hizbQuarter: hizbQuarter ?? this.hizbQuarter,
  );
  AyahEntry copyWithCompanion(AyahsTableCompanion data) {
    return AyahEntry(
      number: data.number.present ? data.number.value : this.number,
      ayahText: data.ayahText.present ? data.ayahText.value : this.ayahText,
      ayahTextUthmani: data.ayahTextUthmani.present
          ? data.ayahTextUthmani.value
          : this.ayahTextUthmani,
      surahNumber: data.surahNumber.present
          ? data.surahNumber.value
          : this.surahNumber,
      numberInSurah: data.numberInSurah.present
          ? data.numberInSurah.value
          : this.numberInSurah,
      juz: data.juz.present ? data.juz.value : this.juz,
      manzil: data.manzil.present ? data.manzil.value : this.manzil,
      page: data.page.present ? data.page.value : this.page,
      ruku: data.ruku.present ? data.ruku.value : this.ruku,
      hizbQuarter: data.hizbQuarter.present
          ? data.hizbQuarter.value
          : this.hizbQuarter,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AyahEntry(')
          ..write('number: $number, ')
          ..write('ayahText: $ayahText, ')
          ..write('ayahTextUthmani: $ayahTextUthmani, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('numberInSurah: $numberInSurah, ')
          ..write('juz: $juz, ')
          ..write('manzil: $manzil, ')
          ..write('page: $page, ')
          ..write('ruku: $ruku, ')
          ..write('hizbQuarter: $hizbQuarter')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    number,
    ayahText,
    ayahTextUthmani,
    surahNumber,
    numberInSurah,
    juz,
    manzil,
    page,
    ruku,
    hizbQuarter,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AyahEntry &&
          other.number == this.number &&
          other.ayahText == this.ayahText &&
          other.ayahTextUthmani == this.ayahTextUthmani &&
          other.surahNumber == this.surahNumber &&
          other.numberInSurah == this.numberInSurah &&
          other.juz == this.juz &&
          other.manzil == this.manzil &&
          other.page == this.page &&
          other.ruku == this.ruku &&
          other.hizbQuarter == this.hizbQuarter);
}

class AyahsTableCompanion extends UpdateCompanion<AyahEntry> {
  final Value<int> number;
  final Value<String> ayahText;
  final Value<String?> ayahTextUthmani;
  final Value<int> surahNumber;
  final Value<int> numberInSurah;
  final Value<int> juz;
  final Value<int> manzil;
  final Value<int> page;
  final Value<int> ruku;
  final Value<int> hizbQuarter;
  const AyahsTableCompanion({
    this.number = const Value.absent(),
    this.ayahText = const Value.absent(),
    this.ayahTextUthmani = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.numberInSurah = const Value.absent(),
    this.juz = const Value.absent(),
    this.manzil = const Value.absent(),
    this.page = const Value.absent(),
    this.ruku = const Value.absent(),
    this.hizbQuarter = const Value.absent(),
  });
  AyahsTableCompanion.insert({
    this.number = const Value.absent(),
    required String ayahText,
    this.ayahTextUthmani = const Value.absent(),
    required int surahNumber,
    required int numberInSurah,
    required int juz,
    required int manzil,
    required int page,
    required int ruku,
    required int hizbQuarter,
  }) : ayahText = Value(ayahText),
       surahNumber = Value(surahNumber),
       numberInSurah = Value(numberInSurah),
       juz = Value(juz),
       manzil = Value(manzil),
       page = Value(page),
       ruku = Value(ruku),
       hizbQuarter = Value(hizbQuarter);
  static Insertable<AyahEntry> custom({
    Expression<int>? number,
    Expression<String>? ayahText,
    Expression<String>? ayahTextUthmani,
    Expression<int>? surahNumber,
    Expression<int>? numberInSurah,
    Expression<int>? juz,
    Expression<int>? manzil,
    Expression<int>? page,
    Expression<int>? ruku,
    Expression<int>? hizbQuarter,
  }) {
    return RawValuesInsertable({
      if (number != null) 'number': number,
      if (ayahText != null) 'ayah_text': ayahText,
      if (ayahTextUthmani != null) 'text_uthmani': ayahTextUthmani,
      if (surahNumber != null) 'surah_number': surahNumber,
      if (numberInSurah != null) 'number_in_surah': numberInSurah,
      if (juz != null) 'juz': juz,
      if (manzil != null) 'manzil': manzil,
      if (page != null) 'page': page,
      if (ruku != null) 'ruku': ruku,
      if (hizbQuarter != null) 'hizb_quarter': hizbQuarter,
    });
  }

  AyahsTableCompanion copyWith({
    Value<int>? number,
    Value<String>? ayahText,
    Value<String?>? ayahTextUthmani,
    Value<int>? surahNumber,
    Value<int>? numberInSurah,
    Value<int>? juz,
    Value<int>? manzil,
    Value<int>? page,
    Value<int>? ruku,
    Value<int>? hizbQuarter,
  }) {
    return AyahsTableCompanion(
      number: number ?? this.number,
      ayahText: ayahText ?? this.ayahText,
      ayahTextUthmani: ayahTextUthmani ?? this.ayahTextUthmani,
      surahNumber: surahNumber ?? this.surahNumber,
      numberInSurah: numberInSurah ?? this.numberInSurah,
      juz: juz ?? this.juz,
      manzil: manzil ?? this.manzil,
      page: page ?? this.page,
      ruku: ruku ?? this.ruku,
      hizbQuarter: hizbQuarter ?? this.hizbQuarter,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (ayahText.present) {
      map['ayah_text'] = Variable<String>(ayahText.value);
    }
    if (ayahTextUthmani.present) {
      map['text_uthmani'] = Variable<String>(ayahTextUthmani.value);
    }
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
    }
    if (numberInSurah.present) {
      map['number_in_surah'] = Variable<int>(numberInSurah.value);
    }
    if (juz.present) {
      map['juz'] = Variable<int>(juz.value);
    }
    if (manzil.present) {
      map['manzil'] = Variable<int>(manzil.value);
    }
    if (page.present) {
      map['page'] = Variable<int>(page.value);
    }
    if (ruku.present) {
      map['ruku'] = Variable<int>(ruku.value);
    }
    if (hizbQuarter.present) {
      map['hizb_quarter'] = Variable<int>(hizbQuarter.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AyahsTableCompanion(')
          ..write('number: $number, ')
          ..write('ayahText: $ayahText, ')
          ..write('ayahTextUthmani: $ayahTextUthmani, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('numberInSurah: $numberInSurah, ')
          ..write('juz: $juz, ')
          ..write('manzil: $manzil, ')
          ..write('page: $page, ')
          ..write('ruku: $ruku, ')
          ..write('hizbQuarter: $hizbQuarter')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTableTable extends FavoritesTable
    with TableInfo<$FavoritesTableTable, FavoritesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _ayahNumberMeta = const VerificationMeta(
    'ayahNumber',
  );
  @override
  late final GeneratedColumn<int> ayahNumber = GeneratedColumn<int>(
    'ayah_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _surahNumberMeta = const VerificationMeta(
    'surahNumber',
  );
  @override
  late final GeneratedColumn<int> surahNumber = GeneratedColumn<int>(
    'surah_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ayahNumber,
    surahNumber,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorites_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoritesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ayah_number')) {
      context.handle(
        _ayahNumberMeta,
        ayahNumber.isAcceptableOrUnknown(data['ayah_number']!, _ayahNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_ayahNumberMeta);
    }
    if (data.containsKey('surah_number')) {
      context.handle(
        _surahNumberMeta,
        surahNumber.isAcceptableOrUnknown(
          data['surah_number']!,
          _surahNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_surahNumberMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoritesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoritesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      ayahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ayah_number'],
      )!,
      surahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surah_number'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FavoritesTableTable createAlias(String alias) {
    return $FavoritesTableTable(attachedDatabase, alias);
  }
}

class FavoritesTableData extends DataClass
    implements Insertable<FavoritesTableData> {
  final int id;
  final int ayahNumber;
  final int surahNumber;
  final DateTime createdAt;
  const FavoritesTableData({
    required this.id,
    required this.ayahNumber,
    required this.surahNumber,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ayah_number'] = Variable<int>(ayahNumber);
    map['surah_number'] = Variable<int>(surahNumber);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FavoritesTableCompanion toCompanion(bool nullToAbsent) {
    return FavoritesTableCompanion(
      id: Value(id),
      ayahNumber: Value(ayahNumber),
      surahNumber: Value(surahNumber),
      createdAt: Value(createdAt),
    );
  }

  factory FavoritesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoritesTableData(
      id: serializer.fromJson<int>(json['id']),
      ayahNumber: serializer.fromJson<int>(json['ayahNumber']),
      surahNumber: serializer.fromJson<int>(json['surahNumber']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ayahNumber': serializer.toJson<int>(ayahNumber),
      'surahNumber': serializer.toJson<int>(surahNumber),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FavoritesTableData copyWith({
    int? id,
    int? ayahNumber,
    int? surahNumber,
    DateTime? createdAt,
  }) => FavoritesTableData(
    id: id ?? this.id,
    ayahNumber: ayahNumber ?? this.ayahNumber,
    surahNumber: surahNumber ?? this.surahNumber,
    createdAt: createdAt ?? this.createdAt,
  );
  FavoritesTableData copyWithCompanion(FavoritesTableCompanion data) {
    return FavoritesTableData(
      id: data.id.present ? data.id.value : this.id,
      ayahNumber: data.ayahNumber.present
          ? data.ayahNumber.value
          : this.ayahNumber,
      surahNumber: data.surahNumber.present
          ? data.surahNumber.value
          : this.surahNumber,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesTableData(')
          ..write('id: $id, ')
          ..write('ayahNumber: $ayahNumber, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ayahNumber, surahNumber, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoritesTableData &&
          other.id == this.id &&
          other.ayahNumber == this.ayahNumber &&
          other.surahNumber == this.surahNumber &&
          other.createdAt == this.createdAt);
}

class FavoritesTableCompanion extends UpdateCompanion<FavoritesTableData> {
  final Value<int> id;
  final Value<int> ayahNumber;
  final Value<int> surahNumber;
  final Value<DateTime> createdAt;
  const FavoritesTableCompanion({
    this.id = const Value.absent(),
    this.ayahNumber = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  FavoritesTableCompanion.insert({
    this.id = const Value.absent(),
    required int ayahNumber,
    required int surahNumber,
    this.createdAt = const Value.absent(),
  }) : ayahNumber = Value(ayahNumber),
       surahNumber = Value(surahNumber);
  static Insertable<FavoritesTableData> custom({
    Expression<int>? id,
    Expression<int>? ayahNumber,
    Expression<int>? surahNumber,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ayahNumber != null) 'ayah_number': ayahNumber,
      if (surahNumber != null) 'surah_number': surahNumber,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  FavoritesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? ayahNumber,
    Value<int>? surahNumber,
    Value<DateTime>? createdAt,
  }) {
    return FavoritesTableCompanion(
      id: id ?? this.id,
      ayahNumber: ayahNumber ?? this.ayahNumber,
      surahNumber: surahNumber ?? this.surahNumber,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ayahNumber.present) {
      map['ayah_number'] = Variable<int>(ayahNumber.value);
    }
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesTableCompanion(')
          ..write('id: $id, ')
          ..write('ayahNumber: $ayahNumber, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $NotesTableTable extends NotesTable
    with TableInfo<$NotesTableTable, NotesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _ayahNumberMeta = const VerificationMeta(
    'ayahNumber',
  );
  @override
  late final GeneratedColumn<int> ayahNumber = GeneratedColumn<int>(
    'ayah_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _surahNumberMeta = const VerificationMeta(
    'surahNumber',
  );
  @override
  late final GeneratedColumn<int> surahNumber = GeneratedColumn<int>(
    'surah_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ayahNumber,
    surahNumber,
    content,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<NotesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ayah_number')) {
      context.handle(
        _ayahNumberMeta,
        ayahNumber.isAcceptableOrUnknown(data['ayah_number']!, _ayahNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_ayahNumberMeta);
    }
    if (data.containsKey('surah_number')) {
      context.handle(
        _surahNumberMeta,
        surahNumber.isAcceptableOrUnknown(
          data['surah_number']!,
          _surahNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_surahNumberMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      ayahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ayah_number'],
      )!,
      surahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surah_number'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $NotesTableTable createAlias(String alias) {
    return $NotesTableTable(attachedDatabase, alias);
  }
}

class NotesTableData extends DataClass implements Insertable<NotesTableData> {
  final int id;
  final int ayahNumber;
  final int surahNumber;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  const NotesTableData({
    required this.id,
    required this.ayahNumber,
    required this.surahNumber,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ayah_number'] = Variable<int>(ayahNumber);
    map['surah_number'] = Variable<int>(surahNumber);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  NotesTableCompanion toCompanion(bool nullToAbsent) {
    return NotesTableCompanion(
      id: Value(id),
      ayahNumber: Value(ayahNumber),
      surahNumber: Value(surahNumber),
      content: Value(content),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory NotesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotesTableData(
      id: serializer.fromJson<int>(json['id']),
      ayahNumber: serializer.fromJson<int>(json['ayahNumber']),
      surahNumber: serializer.fromJson<int>(json['surahNumber']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ayahNumber': serializer.toJson<int>(ayahNumber),
      'surahNumber': serializer.toJson<int>(surahNumber),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  NotesTableData copyWith({
    int? id,
    int? ayahNumber,
    int? surahNumber,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => NotesTableData(
    id: id ?? this.id,
    ayahNumber: ayahNumber ?? this.ayahNumber,
    surahNumber: surahNumber ?? this.surahNumber,
    content: content ?? this.content,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  NotesTableData copyWithCompanion(NotesTableCompanion data) {
    return NotesTableData(
      id: data.id.present ? data.id.value : this.id,
      ayahNumber: data.ayahNumber.present
          ? data.ayahNumber.value
          : this.ayahNumber,
      surahNumber: data.surahNumber.present
          ? data.surahNumber.value
          : this.surahNumber,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotesTableData(')
          ..write('id: $id, ')
          ..write('ayahNumber: $ayahNumber, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, ayahNumber, surahNumber, content, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotesTableData &&
          other.id == this.id &&
          other.ayahNumber == this.ayahNumber &&
          other.surahNumber == this.surahNumber &&
          other.content == this.content &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class NotesTableCompanion extends UpdateCompanion<NotesTableData> {
  final Value<int> id;
  final Value<int> ayahNumber;
  final Value<int> surahNumber;
  final Value<String> content;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const NotesTableCompanion({
    this.id = const Value.absent(),
    this.ayahNumber = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  NotesTableCompanion.insert({
    this.id = const Value.absent(),
    required int ayahNumber,
    required int surahNumber,
    required String content,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : ayahNumber = Value(ayahNumber),
       surahNumber = Value(surahNumber),
       content = Value(content);
  static Insertable<NotesTableData> custom({
    Expression<int>? id,
    Expression<int>? ayahNumber,
    Expression<int>? surahNumber,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ayahNumber != null) 'ayah_number': ayahNumber,
      if (surahNumber != null) 'surah_number': surahNumber,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  NotesTableCompanion copyWith({
    Value<int>? id,
    Value<int>? ayahNumber,
    Value<int>? surahNumber,
    Value<String>? content,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return NotesTableCompanion(
      id: id ?? this.id,
      ayahNumber: ayahNumber ?? this.ayahNumber,
      surahNumber: surahNumber ?? this.surahNumber,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ayahNumber.present) {
      map['ayah_number'] = Variable<int>(ayahNumber.value);
    }
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesTableCompanion(')
          ..write('id: $id, ')
          ..write('ayahNumber: $ayahNumber, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TafsirCacheTableTable extends TafsirCacheTable
    with TableInfo<$TafsirCacheTableTable, TafsirCacheTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TafsirCacheTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _ayahNumberMeta = const VerificationMeta(
    'ayahNumber',
  );
  @override
  late final GeneratedColumn<int> ayahNumber = GeneratedColumn<int>(
    'ayah_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tafsirTextMeta = const VerificationMeta(
    'tafsirText',
  );
  @override
  late final GeneratedColumn<String> tafsirText = GeneratedColumn<String>(
    'tafsir_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _editionMeta = const VerificationMeta(
    'edition',
  );
  @override
  late final GeneratedColumn<String> edition = GeneratedColumn<String>(
    'edition',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    ayahNumber,
    tafsirText,
    edition,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tafsir_cache_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TafsirCacheTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ayah_number')) {
      context.handle(
        _ayahNumberMeta,
        ayahNumber.isAcceptableOrUnknown(data['ayah_number']!, _ayahNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_ayahNumberMeta);
    }
    if (data.containsKey('tafsir_text')) {
      context.handle(
        _tafsirTextMeta,
        tafsirText.isAcceptableOrUnknown(data['tafsir_text']!, _tafsirTextMeta),
      );
    } else if (isInserting) {
      context.missing(_tafsirTextMeta);
    }
    if (data.containsKey('edition')) {
      context.handle(
        _editionMeta,
        edition.isAcceptableOrUnknown(data['edition']!, _editionMeta),
      );
    } else if (isInserting) {
      context.missing(_editionMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ayahNumber, edition};
  @override
  TafsirCacheTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TafsirCacheTableData(
      ayahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ayah_number'],
      )!,
      tafsirText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tafsir_text'],
      )!,
      edition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}edition'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $TafsirCacheTableTable createAlias(String alias) {
    return $TafsirCacheTableTable(attachedDatabase, alias);
  }
}

class TafsirCacheTableData extends DataClass
    implements Insertable<TafsirCacheTableData> {
  final int ayahNumber;
  final String tafsirText;
  final String edition;
  final DateTime cachedAt;
  const TafsirCacheTableData({
    required this.ayahNumber,
    required this.tafsirText,
    required this.edition,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ayah_number'] = Variable<int>(ayahNumber);
    map['tafsir_text'] = Variable<String>(tafsirText);
    map['edition'] = Variable<String>(edition);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  TafsirCacheTableCompanion toCompanion(bool nullToAbsent) {
    return TafsirCacheTableCompanion(
      ayahNumber: Value(ayahNumber),
      tafsirText: Value(tafsirText),
      edition: Value(edition),
      cachedAt: Value(cachedAt),
    );
  }

  factory TafsirCacheTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TafsirCacheTableData(
      ayahNumber: serializer.fromJson<int>(json['ayahNumber']),
      tafsirText: serializer.fromJson<String>(json['tafsirText']),
      edition: serializer.fromJson<String>(json['edition']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ayahNumber': serializer.toJson<int>(ayahNumber),
      'tafsirText': serializer.toJson<String>(tafsirText),
      'edition': serializer.toJson<String>(edition),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  TafsirCacheTableData copyWith({
    int? ayahNumber,
    String? tafsirText,
    String? edition,
    DateTime? cachedAt,
  }) => TafsirCacheTableData(
    ayahNumber: ayahNumber ?? this.ayahNumber,
    tafsirText: tafsirText ?? this.tafsirText,
    edition: edition ?? this.edition,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  TafsirCacheTableData copyWithCompanion(TafsirCacheTableCompanion data) {
    return TafsirCacheTableData(
      ayahNumber: data.ayahNumber.present
          ? data.ayahNumber.value
          : this.ayahNumber,
      tafsirText: data.tafsirText.present
          ? data.tafsirText.value
          : this.tafsirText,
      edition: data.edition.present ? data.edition.value : this.edition,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TafsirCacheTableData(')
          ..write('ayahNumber: $ayahNumber, ')
          ..write('tafsirText: $tafsirText, ')
          ..write('edition: $edition, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(ayahNumber, tafsirText, edition, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TafsirCacheTableData &&
          other.ayahNumber == this.ayahNumber &&
          other.tafsirText == this.tafsirText &&
          other.edition == this.edition &&
          other.cachedAt == this.cachedAt);
}

class TafsirCacheTableCompanion extends UpdateCompanion<TafsirCacheTableData> {
  final Value<int> ayahNumber;
  final Value<String> tafsirText;
  final Value<String> edition;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const TafsirCacheTableCompanion({
    this.ayahNumber = const Value.absent(),
    this.tafsirText = const Value.absent(),
    this.edition = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TafsirCacheTableCompanion.insert({
    required int ayahNumber,
    required String tafsirText,
    required String edition,
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : ayahNumber = Value(ayahNumber),
       tafsirText = Value(tafsirText),
       edition = Value(edition);
  static Insertable<TafsirCacheTableData> custom({
    Expression<int>? ayahNumber,
    Expression<String>? tafsirText,
    Expression<String>? edition,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (ayahNumber != null) 'ayah_number': ayahNumber,
      if (tafsirText != null) 'tafsir_text': tafsirText,
      if (edition != null) 'edition': edition,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TafsirCacheTableCompanion copyWith({
    Value<int>? ayahNumber,
    Value<String>? tafsirText,
    Value<String>? edition,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return TafsirCacheTableCompanion(
      ayahNumber: ayahNumber ?? this.ayahNumber,
      tafsirText: tafsirText ?? this.tafsirText,
      edition: edition ?? this.edition,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ayahNumber.present) {
      map['ayah_number'] = Variable<int>(ayahNumber.value);
    }
    if (tafsirText.present) {
      map['tafsir_text'] = Variable<String>(tafsirText.value);
    }
    if (edition.present) {
      map['edition'] = Variable<String>(edition.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TafsirCacheTableCompanion(')
          ..write('ayahNumber: $ayahNumber, ')
          ..write('tafsirText: $tafsirText, ')
          ..write('edition: $edition, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AudioCacheTableTable extends AudioCacheTable
    with TableInfo<$AudioCacheTableTable, AudioCacheTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AudioCacheTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _ayahNumberMeta = const VerificationMeta(
    'ayahNumber',
  );
  @override
  late final GeneratedColumn<int> ayahNumber = GeneratedColumn<int>(
    'ayah_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _audioUrlMeta = const VerificationMeta(
    'audioUrl',
  );
  @override
  late final GeneratedColumn<String> audioUrl = GeneratedColumn<String>(
    'audio_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reciterIdMeta = const VerificationMeta(
    'reciterId',
  );
  @override
  late final GeneratedColumn<String> reciterId = GeneratedColumn<String>(
    'reciter_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDownloadedMeta = const VerificationMeta(
    'isDownloaded',
  );
  @override
  late final GeneratedColumn<bool> isDownloaded = GeneratedColumn<bool>(
    'is_downloaded',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_downloaded" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    ayahNumber,
    audioUrl,
    reciterId,
    filePath,
    isDownloaded,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audio_cache_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AudioCacheTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ayah_number')) {
      context.handle(
        _ayahNumberMeta,
        ayahNumber.isAcceptableOrUnknown(data['ayah_number']!, _ayahNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_ayahNumberMeta);
    }
    if (data.containsKey('audio_url')) {
      context.handle(
        _audioUrlMeta,
        audioUrl.isAcceptableOrUnknown(data['audio_url']!, _audioUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_audioUrlMeta);
    }
    if (data.containsKey('reciter_id')) {
      context.handle(
        _reciterIdMeta,
        reciterId.isAcceptableOrUnknown(data['reciter_id']!, _reciterIdMeta),
      );
    } else if (isInserting) {
      context.missing(_reciterIdMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    }
    if (data.containsKey('is_downloaded')) {
      context.handle(
        _isDownloadedMeta,
        isDownloaded.isAcceptableOrUnknown(
          data['is_downloaded']!,
          _isDownloadedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ayahNumber, reciterId};
  @override
  AudioCacheTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AudioCacheTableData(
      ayahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ayah_number'],
      )!,
      audioUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_url'],
      )!,
      reciterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reciter_id'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      ),
      isDownloaded: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_downloaded'],
      )!,
    );
  }

  @override
  $AudioCacheTableTable createAlias(String alias) {
    return $AudioCacheTableTable(attachedDatabase, alias);
  }
}

class AudioCacheTableData extends DataClass
    implements Insertable<AudioCacheTableData> {
  final int ayahNumber;
  final String audioUrl;
  final String reciterId;
  final String? filePath;
  final bool isDownloaded;
  const AudioCacheTableData({
    required this.ayahNumber,
    required this.audioUrl,
    required this.reciterId,
    this.filePath,
    required this.isDownloaded,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ayah_number'] = Variable<int>(ayahNumber);
    map['audio_url'] = Variable<String>(audioUrl);
    map['reciter_id'] = Variable<String>(reciterId);
    if (!nullToAbsent || filePath != null) {
      map['file_path'] = Variable<String>(filePath);
    }
    map['is_downloaded'] = Variable<bool>(isDownloaded);
    return map;
  }

  AudioCacheTableCompanion toCompanion(bool nullToAbsent) {
    return AudioCacheTableCompanion(
      ayahNumber: Value(ayahNumber),
      audioUrl: Value(audioUrl),
      reciterId: Value(reciterId),
      filePath: filePath == null && nullToAbsent
          ? const Value.absent()
          : Value(filePath),
      isDownloaded: Value(isDownloaded),
    );
  }

  factory AudioCacheTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AudioCacheTableData(
      ayahNumber: serializer.fromJson<int>(json['ayahNumber']),
      audioUrl: serializer.fromJson<String>(json['audioUrl']),
      reciterId: serializer.fromJson<String>(json['reciterId']),
      filePath: serializer.fromJson<String?>(json['filePath']),
      isDownloaded: serializer.fromJson<bool>(json['isDownloaded']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ayahNumber': serializer.toJson<int>(ayahNumber),
      'audioUrl': serializer.toJson<String>(audioUrl),
      'reciterId': serializer.toJson<String>(reciterId),
      'filePath': serializer.toJson<String?>(filePath),
      'isDownloaded': serializer.toJson<bool>(isDownloaded),
    };
  }

  AudioCacheTableData copyWith({
    int? ayahNumber,
    String? audioUrl,
    String? reciterId,
    Value<String?> filePath = const Value.absent(),
    bool? isDownloaded,
  }) => AudioCacheTableData(
    ayahNumber: ayahNumber ?? this.ayahNumber,
    audioUrl: audioUrl ?? this.audioUrl,
    reciterId: reciterId ?? this.reciterId,
    filePath: filePath.present ? filePath.value : this.filePath,
    isDownloaded: isDownloaded ?? this.isDownloaded,
  );
  AudioCacheTableData copyWithCompanion(AudioCacheTableCompanion data) {
    return AudioCacheTableData(
      ayahNumber: data.ayahNumber.present
          ? data.ayahNumber.value
          : this.ayahNumber,
      audioUrl: data.audioUrl.present ? data.audioUrl.value : this.audioUrl,
      reciterId: data.reciterId.present ? data.reciterId.value : this.reciterId,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      isDownloaded: data.isDownloaded.present
          ? data.isDownloaded.value
          : this.isDownloaded,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AudioCacheTableData(')
          ..write('ayahNumber: $ayahNumber, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('reciterId: $reciterId, ')
          ..write('filePath: $filePath, ')
          ..write('isDownloaded: $isDownloaded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(ayahNumber, audioUrl, reciterId, filePath, isDownloaded);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AudioCacheTableData &&
          other.ayahNumber == this.ayahNumber &&
          other.audioUrl == this.audioUrl &&
          other.reciterId == this.reciterId &&
          other.filePath == this.filePath &&
          other.isDownloaded == this.isDownloaded);
}

class AudioCacheTableCompanion extends UpdateCompanion<AudioCacheTableData> {
  final Value<int> ayahNumber;
  final Value<String> audioUrl;
  final Value<String> reciterId;
  final Value<String?> filePath;
  final Value<bool> isDownloaded;
  final Value<int> rowid;
  const AudioCacheTableCompanion({
    this.ayahNumber = const Value.absent(),
    this.audioUrl = const Value.absent(),
    this.reciterId = const Value.absent(),
    this.filePath = const Value.absent(),
    this.isDownloaded = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AudioCacheTableCompanion.insert({
    required int ayahNumber,
    required String audioUrl,
    required String reciterId,
    this.filePath = const Value.absent(),
    this.isDownloaded = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : ayahNumber = Value(ayahNumber),
       audioUrl = Value(audioUrl),
       reciterId = Value(reciterId);
  static Insertable<AudioCacheTableData> custom({
    Expression<int>? ayahNumber,
    Expression<String>? audioUrl,
    Expression<String>? reciterId,
    Expression<String>? filePath,
    Expression<bool>? isDownloaded,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (ayahNumber != null) 'ayah_number': ayahNumber,
      if (audioUrl != null) 'audio_url': audioUrl,
      if (reciterId != null) 'reciter_id': reciterId,
      if (filePath != null) 'file_path': filePath,
      if (isDownloaded != null) 'is_downloaded': isDownloaded,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AudioCacheTableCompanion copyWith({
    Value<int>? ayahNumber,
    Value<String>? audioUrl,
    Value<String>? reciterId,
    Value<String?>? filePath,
    Value<bool>? isDownloaded,
    Value<int>? rowid,
  }) {
    return AudioCacheTableCompanion(
      ayahNumber: ayahNumber ?? this.ayahNumber,
      audioUrl: audioUrl ?? this.audioUrl,
      reciterId: reciterId ?? this.reciterId,
      filePath: filePath ?? this.filePath,
      isDownloaded: isDownloaded ?? this.isDownloaded,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ayahNumber.present) {
      map['ayah_number'] = Variable<int>(ayahNumber.value);
    }
    if (audioUrl.present) {
      map['audio_url'] = Variable<String>(audioUrl.value);
    }
    if (reciterId.present) {
      map['reciter_id'] = Variable<String>(reciterId.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (isDownloaded.present) {
      map['is_downloaded'] = Variable<bool>(isDownloaded.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AudioCacheTableCompanion(')
          ..write('ayahNumber: $ayahNumber, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('reciterId: $reciterId, ')
          ..write('filePath: $filePath, ')
          ..write('isDownloaded: $isDownloaded, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SurahsTableTable surahsTable = $SurahsTableTable(this);
  late final $AyahsTableTable ayahsTable = $AyahsTableTable(this);
  late final $FavoritesTableTable favoritesTable = $FavoritesTableTable(this);
  late final $NotesTableTable notesTable = $NotesTableTable(this);
  late final $TafsirCacheTableTable tafsirCacheTable = $TafsirCacheTableTable(
    this,
  );
  late final $AudioCacheTableTable audioCacheTable = $AudioCacheTableTable(
    this,
  );
  late final QuranDao quranDao = QuranDao(this as AppDatabase);
  late final FavoritesDao favoritesDao = FavoritesDao(this as AppDatabase);
  late final NotesDao notesDao = NotesDao(this as AppDatabase);
  late final TafsirDao tafsirDao = TafsirDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    surahsTable,
    ayahsTable,
    favoritesTable,
    notesTable,
    tafsirCacheTable,
    audioCacheTable,
  ];
}

typedef $$SurahsTableTableCreateCompanionBuilder =
    SurahsTableCompanion Function({
      Value<int> number,
      required String name,
      required String englishName,
      required String englishNameTranslation,
      required int numberOfAyahs,
      required String revelationType,
    });
typedef $$SurahsTableTableUpdateCompanionBuilder =
    SurahsTableCompanion Function({
      Value<int> number,
      Value<String> name,
      Value<String> englishName,
      Value<String> englishNameTranslation,
      Value<int> numberOfAyahs,
      Value<String> revelationType,
    });

class $$SurahsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SurahsTableTable> {
  $$SurahsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get englishName => $composableBuilder(
    column: $table.englishName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get englishNameTranslation => $composableBuilder(
    column: $table.englishNameTranslation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numberOfAyahs => $composableBuilder(
    column: $table.numberOfAyahs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get revelationType => $composableBuilder(
    column: $table.revelationType,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SurahsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SurahsTableTable> {
  $$SurahsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get englishName => $composableBuilder(
    column: $table.englishName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get englishNameTranslation => $composableBuilder(
    column: $table.englishNameTranslation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numberOfAyahs => $composableBuilder(
    column: $table.numberOfAyahs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get revelationType => $composableBuilder(
    column: $table.revelationType,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SurahsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SurahsTableTable> {
  $$SurahsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get englishName => $composableBuilder(
    column: $table.englishName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get englishNameTranslation => $composableBuilder(
    column: $table.englishNameTranslation,
    builder: (column) => column,
  );

  GeneratedColumn<int> get numberOfAyahs => $composableBuilder(
    column: $table.numberOfAyahs,
    builder: (column) => column,
  );

  GeneratedColumn<String> get revelationType => $composableBuilder(
    column: $table.revelationType,
    builder: (column) => column,
  );
}

class $$SurahsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SurahsTableTable,
          SurahsTableData,
          $$SurahsTableTableFilterComposer,
          $$SurahsTableTableOrderingComposer,
          $$SurahsTableTableAnnotationComposer,
          $$SurahsTableTableCreateCompanionBuilder,
          $$SurahsTableTableUpdateCompanionBuilder,
          (
            SurahsTableData,
            BaseReferences<_$AppDatabase, $SurahsTableTable, SurahsTableData>,
          ),
          SurahsTableData,
          PrefetchHooks Function()
        > {
  $$SurahsTableTableTableManager(_$AppDatabase db, $SurahsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SurahsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SurahsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SurahsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> number = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> englishName = const Value.absent(),
                Value<String> englishNameTranslation = const Value.absent(),
                Value<int> numberOfAyahs = const Value.absent(),
                Value<String> revelationType = const Value.absent(),
              }) => SurahsTableCompanion(
                number: number,
                name: name,
                englishName: englishName,
                englishNameTranslation: englishNameTranslation,
                numberOfAyahs: numberOfAyahs,
                revelationType: revelationType,
              ),
          createCompanionCallback:
              ({
                Value<int> number = const Value.absent(),
                required String name,
                required String englishName,
                required String englishNameTranslation,
                required int numberOfAyahs,
                required String revelationType,
              }) => SurahsTableCompanion.insert(
                number: number,
                name: name,
                englishName: englishName,
                englishNameTranslation: englishNameTranslation,
                numberOfAyahs: numberOfAyahs,
                revelationType: revelationType,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SurahsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SurahsTableTable,
      SurahsTableData,
      $$SurahsTableTableFilterComposer,
      $$SurahsTableTableOrderingComposer,
      $$SurahsTableTableAnnotationComposer,
      $$SurahsTableTableCreateCompanionBuilder,
      $$SurahsTableTableUpdateCompanionBuilder,
      (
        SurahsTableData,
        BaseReferences<_$AppDatabase, $SurahsTableTable, SurahsTableData>,
      ),
      SurahsTableData,
      PrefetchHooks Function()
    >;
typedef $$AyahsTableTableCreateCompanionBuilder =
    AyahsTableCompanion Function({
      Value<int> number,
      required String ayahText,
      Value<String?> ayahTextUthmani,
      required int surahNumber,
      required int numberInSurah,
      required int juz,
      required int manzil,
      required int page,
      required int ruku,
      required int hizbQuarter,
    });
typedef $$AyahsTableTableUpdateCompanionBuilder =
    AyahsTableCompanion Function({
      Value<int> number,
      Value<String> ayahText,
      Value<String?> ayahTextUthmani,
      Value<int> surahNumber,
      Value<int> numberInSurah,
      Value<int> juz,
      Value<int> manzil,
      Value<int> page,
      Value<int> ruku,
      Value<int> hizbQuarter,
    });

class $$AyahsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AyahsTableTable> {
  $$AyahsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ayahText => $composableBuilder(
    column: $table.ayahText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ayahTextUthmani => $composableBuilder(
    column: $table.ayahTextUthmani,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numberInSurah => $composableBuilder(
    column: $table.numberInSurah,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get juz => $composableBuilder(
    column: $table.juz,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get manzil => $composableBuilder(
    column: $table.manzil,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get page => $composableBuilder(
    column: $table.page,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ruku => $composableBuilder(
    column: $table.ruku,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hizbQuarter => $composableBuilder(
    column: $table.hizbQuarter,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AyahsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AyahsTableTable> {
  $$AyahsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ayahText => $composableBuilder(
    column: $table.ayahText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ayahTextUthmani => $composableBuilder(
    column: $table.ayahTextUthmani,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numberInSurah => $composableBuilder(
    column: $table.numberInSurah,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get juz => $composableBuilder(
    column: $table.juz,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get manzil => $composableBuilder(
    column: $table.manzil,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get page => $composableBuilder(
    column: $table.page,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ruku => $composableBuilder(
    column: $table.ruku,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hizbQuarter => $composableBuilder(
    column: $table.hizbQuarter,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AyahsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AyahsTableTable> {
  $$AyahsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<String> get ayahText =>
      $composableBuilder(column: $table.ayahText, builder: (column) => column);

  GeneratedColumn<String> get ayahTextUthmani => $composableBuilder(
    column: $table.ayahTextUthmani,
    builder: (column) => column,
  );

  GeneratedColumn<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get numberInSurah => $composableBuilder(
    column: $table.numberInSurah,
    builder: (column) => column,
  );

  GeneratedColumn<int> get juz =>
      $composableBuilder(column: $table.juz, builder: (column) => column);

  GeneratedColumn<int> get manzil =>
      $composableBuilder(column: $table.manzil, builder: (column) => column);

  GeneratedColumn<int> get page =>
      $composableBuilder(column: $table.page, builder: (column) => column);

  GeneratedColumn<int> get ruku =>
      $composableBuilder(column: $table.ruku, builder: (column) => column);

  GeneratedColumn<int> get hizbQuarter => $composableBuilder(
    column: $table.hizbQuarter,
    builder: (column) => column,
  );
}

class $$AyahsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AyahsTableTable,
          AyahEntry,
          $$AyahsTableTableFilterComposer,
          $$AyahsTableTableOrderingComposer,
          $$AyahsTableTableAnnotationComposer,
          $$AyahsTableTableCreateCompanionBuilder,
          $$AyahsTableTableUpdateCompanionBuilder,
          (
            AyahEntry,
            BaseReferences<_$AppDatabase, $AyahsTableTable, AyahEntry>,
          ),
          AyahEntry,
          PrefetchHooks Function()
        > {
  $$AyahsTableTableTableManager(_$AppDatabase db, $AyahsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AyahsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AyahsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AyahsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> number = const Value.absent(),
                Value<String> ayahText = const Value.absent(),
                Value<String?> ayahTextUthmani = const Value.absent(),
                Value<int> surahNumber = const Value.absent(),
                Value<int> numberInSurah = const Value.absent(),
                Value<int> juz = const Value.absent(),
                Value<int> manzil = const Value.absent(),
                Value<int> page = const Value.absent(),
                Value<int> ruku = const Value.absent(),
                Value<int> hizbQuarter = const Value.absent(),
              }) => AyahsTableCompanion(
                number: number,
                ayahText: ayahText,
                ayahTextUthmani: ayahTextUthmani,
                surahNumber: surahNumber,
                numberInSurah: numberInSurah,
                juz: juz,
                manzil: manzil,
                page: page,
                ruku: ruku,
                hizbQuarter: hizbQuarter,
              ),
          createCompanionCallback:
              ({
                Value<int> number = const Value.absent(),
                required String ayahText,
                Value<String?> ayahTextUthmani = const Value.absent(),
                required int surahNumber,
                required int numberInSurah,
                required int juz,
                required int manzil,
                required int page,
                required int ruku,
                required int hizbQuarter,
              }) => AyahsTableCompanion.insert(
                number: number,
                ayahText: ayahText,
                ayahTextUthmani: ayahTextUthmani,
                surahNumber: surahNumber,
                numberInSurah: numberInSurah,
                juz: juz,
                manzil: manzil,
                page: page,
                ruku: ruku,
                hizbQuarter: hizbQuarter,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AyahsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AyahsTableTable,
      AyahEntry,
      $$AyahsTableTableFilterComposer,
      $$AyahsTableTableOrderingComposer,
      $$AyahsTableTableAnnotationComposer,
      $$AyahsTableTableCreateCompanionBuilder,
      $$AyahsTableTableUpdateCompanionBuilder,
      (AyahEntry, BaseReferences<_$AppDatabase, $AyahsTableTable, AyahEntry>),
      AyahEntry,
      PrefetchHooks Function()
    >;
typedef $$FavoritesTableTableCreateCompanionBuilder =
    FavoritesTableCompanion Function({
      Value<int> id,
      required int ayahNumber,
      required int surahNumber,
      Value<DateTime> createdAt,
    });
typedef $$FavoritesTableTableUpdateCompanionBuilder =
    FavoritesTableCompanion Function({
      Value<int> id,
      Value<int> ayahNumber,
      Value<int> surahNumber,
      Value<DateTime> createdAt,
    });

class $$FavoritesTableTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritesTableTable> {
  $$FavoritesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ayahNumber => $composableBuilder(
    column: $table.ayahNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoritesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritesTableTable> {
  $$FavoritesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ayahNumber => $composableBuilder(
    column: $table.ayahNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoritesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritesTableTable> {
  $$FavoritesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get ayahNumber => $composableBuilder(
    column: $table.ayahNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FavoritesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoritesTableTable,
          FavoritesTableData,
          $$FavoritesTableTableFilterComposer,
          $$FavoritesTableTableOrderingComposer,
          $$FavoritesTableTableAnnotationComposer,
          $$FavoritesTableTableCreateCompanionBuilder,
          $$FavoritesTableTableUpdateCompanionBuilder,
          (
            FavoritesTableData,
            BaseReferences<
              _$AppDatabase,
              $FavoritesTableTable,
              FavoritesTableData
            >,
          ),
          FavoritesTableData,
          PrefetchHooks Function()
        > {
  $$FavoritesTableTableTableManager(
    _$AppDatabase db,
    $FavoritesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> ayahNumber = const Value.absent(),
                Value<int> surahNumber = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => FavoritesTableCompanion(
                id: id,
                ayahNumber: ayahNumber,
                surahNumber: surahNumber,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int ayahNumber,
                required int surahNumber,
                Value<DateTime> createdAt = const Value.absent(),
              }) => FavoritesTableCompanion.insert(
                id: id,
                ayahNumber: ayahNumber,
                surahNumber: surahNumber,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoritesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoritesTableTable,
      FavoritesTableData,
      $$FavoritesTableTableFilterComposer,
      $$FavoritesTableTableOrderingComposer,
      $$FavoritesTableTableAnnotationComposer,
      $$FavoritesTableTableCreateCompanionBuilder,
      $$FavoritesTableTableUpdateCompanionBuilder,
      (
        FavoritesTableData,
        BaseReferences<_$AppDatabase, $FavoritesTableTable, FavoritesTableData>,
      ),
      FavoritesTableData,
      PrefetchHooks Function()
    >;
typedef $$NotesTableTableCreateCompanionBuilder =
    NotesTableCompanion Function({
      Value<int> id,
      required int ayahNumber,
      required int surahNumber,
      required String content,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$NotesTableTableUpdateCompanionBuilder =
    NotesTableCompanion Function({
      Value<int> id,
      Value<int> ayahNumber,
      Value<int> surahNumber,
      Value<String> content,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$NotesTableTableFilterComposer
    extends Composer<_$AppDatabase, $NotesTableTable> {
  $$NotesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ayahNumber => $composableBuilder(
    column: $table.ayahNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NotesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $NotesTableTable> {
  $$NotesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ayahNumber => $composableBuilder(
    column: $table.ayahNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NotesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotesTableTable> {
  $$NotesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get ayahNumber => $composableBuilder(
    column: $table.ayahNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$NotesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotesTableTable,
          NotesTableData,
          $$NotesTableTableFilterComposer,
          $$NotesTableTableOrderingComposer,
          $$NotesTableTableAnnotationComposer,
          $$NotesTableTableCreateCompanionBuilder,
          $$NotesTableTableUpdateCompanionBuilder,
          (
            NotesTableData,
            BaseReferences<_$AppDatabase, $NotesTableTable, NotesTableData>,
          ),
          NotesTableData,
          PrefetchHooks Function()
        > {
  $$NotesTableTableTableManager(_$AppDatabase db, $NotesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> ayahNumber = const Value.absent(),
                Value<int> surahNumber = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => NotesTableCompanion(
                id: id,
                ayahNumber: ayahNumber,
                surahNumber: surahNumber,
                content: content,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int ayahNumber,
                required int surahNumber,
                required String content,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => NotesTableCompanion.insert(
                id: id,
                ayahNumber: ayahNumber,
                surahNumber: surahNumber,
                content: content,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotesTableTable,
      NotesTableData,
      $$NotesTableTableFilterComposer,
      $$NotesTableTableOrderingComposer,
      $$NotesTableTableAnnotationComposer,
      $$NotesTableTableCreateCompanionBuilder,
      $$NotesTableTableUpdateCompanionBuilder,
      (
        NotesTableData,
        BaseReferences<_$AppDatabase, $NotesTableTable, NotesTableData>,
      ),
      NotesTableData,
      PrefetchHooks Function()
    >;
typedef $$TafsirCacheTableTableCreateCompanionBuilder =
    TafsirCacheTableCompanion Function({
      required int ayahNumber,
      required String tafsirText,
      required String edition,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });
typedef $$TafsirCacheTableTableUpdateCompanionBuilder =
    TafsirCacheTableCompanion Function({
      Value<int> ayahNumber,
      Value<String> tafsirText,
      Value<String> edition,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$TafsirCacheTableTableFilterComposer
    extends Composer<_$AppDatabase, $TafsirCacheTableTable> {
  $$TafsirCacheTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get ayahNumber => $composableBuilder(
    column: $table.ayahNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tafsirText => $composableBuilder(
    column: $table.tafsirText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get edition => $composableBuilder(
    column: $table.edition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TafsirCacheTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TafsirCacheTableTable> {
  $$TafsirCacheTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get ayahNumber => $composableBuilder(
    column: $table.ayahNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tafsirText => $composableBuilder(
    column: $table.tafsirText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get edition => $composableBuilder(
    column: $table.edition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TafsirCacheTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TafsirCacheTableTable> {
  $$TafsirCacheTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get ayahNumber => $composableBuilder(
    column: $table.ayahNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tafsirText => $composableBuilder(
    column: $table.tafsirText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get edition =>
      $composableBuilder(column: $table.edition, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$TafsirCacheTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TafsirCacheTableTable,
          TafsirCacheTableData,
          $$TafsirCacheTableTableFilterComposer,
          $$TafsirCacheTableTableOrderingComposer,
          $$TafsirCacheTableTableAnnotationComposer,
          $$TafsirCacheTableTableCreateCompanionBuilder,
          $$TafsirCacheTableTableUpdateCompanionBuilder,
          (
            TafsirCacheTableData,
            BaseReferences<
              _$AppDatabase,
              $TafsirCacheTableTable,
              TafsirCacheTableData
            >,
          ),
          TafsirCacheTableData,
          PrefetchHooks Function()
        > {
  $$TafsirCacheTableTableTableManager(
    _$AppDatabase db,
    $TafsirCacheTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TafsirCacheTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TafsirCacheTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TafsirCacheTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> ayahNumber = const Value.absent(),
                Value<String> tafsirText = const Value.absent(),
                Value<String> edition = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TafsirCacheTableCompanion(
                ayahNumber: ayahNumber,
                tafsirText: tafsirText,
                edition: edition,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int ayahNumber,
                required String tafsirText,
                required String edition,
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TafsirCacheTableCompanion.insert(
                ayahNumber: ayahNumber,
                tafsirText: tafsirText,
                edition: edition,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TafsirCacheTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TafsirCacheTableTable,
      TafsirCacheTableData,
      $$TafsirCacheTableTableFilterComposer,
      $$TafsirCacheTableTableOrderingComposer,
      $$TafsirCacheTableTableAnnotationComposer,
      $$TafsirCacheTableTableCreateCompanionBuilder,
      $$TafsirCacheTableTableUpdateCompanionBuilder,
      (
        TafsirCacheTableData,
        BaseReferences<
          _$AppDatabase,
          $TafsirCacheTableTable,
          TafsirCacheTableData
        >,
      ),
      TafsirCacheTableData,
      PrefetchHooks Function()
    >;
typedef $$AudioCacheTableTableCreateCompanionBuilder =
    AudioCacheTableCompanion Function({
      required int ayahNumber,
      required String audioUrl,
      required String reciterId,
      Value<String?> filePath,
      Value<bool> isDownloaded,
      Value<int> rowid,
    });
typedef $$AudioCacheTableTableUpdateCompanionBuilder =
    AudioCacheTableCompanion Function({
      Value<int> ayahNumber,
      Value<String> audioUrl,
      Value<String> reciterId,
      Value<String?> filePath,
      Value<bool> isDownloaded,
      Value<int> rowid,
    });

class $$AudioCacheTableTableFilterComposer
    extends Composer<_$AppDatabase, $AudioCacheTableTable> {
  $$AudioCacheTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get ayahNumber => $composableBuilder(
    column: $table.ayahNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get audioUrl => $composableBuilder(
    column: $table.audioUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reciterId => $composableBuilder(
    column: $table.reciterId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDownloaded => $composableBuilder(
    column: $table.isDownloaded,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AudioCacheTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AudioCacheTableTable> {
  $$AudioCacheTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get ayahNumber => $composableBuilder(
    column: $table.ayahNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get audioUrl => $composableBuilder(
    column: $table.audioUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reciterId => $composableBuilder(
    column: $table.reciterId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDownloaded => $composableBuilder(
    column: $table.isDownloaded,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AudioCacheTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AudioCacheTableTable> {
  $$AudioCacheTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get ayahNumber => $composableBuilder(
    column: $table.ayahNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get audioUrl =>
      $composableBuilder(column: $table.audioUrl, builder: (column) => column);

  GeneratedColumn<String> get reciterId =>
      $composableBuilder(column: $table.reciterId, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<bool> get isDownloaded => $composableBuilder(
    column: $table.isDownloaded,
    builder: (column) => column,
  );
}

class $$AudioCacheTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AudioCacheTableTable,
          AudioCacheTableData,
          $$AudioCacheTableTableFilterComposer,
          $$AudioCacheTableTableOrderingComposer,
          $$AudioCacheTableTableAnnotationComposer,
          $$AudioCacheTableTableCreateCompanionBuilder,
          $$AudioCacheTableTableUpdateCompanionBuilder,
          (
            AudioCacheTableData,
            BaseReferences<
              _$AppDatabase,
              $AudioCacheTableTable,
              AudioCacheTableData
            >,
          ),
          AudioCacheTableData,
          PrefetchHooks Function()
        > {
  $$AudioCacheTableTableTableManager(
    _$AppDatabase db,
    $AudioCacheTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AudioCacheTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AudioCacheTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AudioCacheTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> ayahNumber = const Value.absent(),
                Value<String> audioUrl = const Value.absent(),
                Value<String> reciterId = const Value.absent(),
                Value<String?> filePath = const Value.absent(),
                Value<bool> isDownloaded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AudioCacheTableCompanion(
                ayahNumber: ayahNumber,
                audioUrl: audioUrl,
                reciterId: reciterId,
                filePath: filePath,
                isDownloaded: isDownloaded,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int ayahNumber,
                required String audioUrl,
                required String reciterId,
                Value<String?> filePath = const Value.absent(),
                Value<bool> isDownloaded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AudioCacheTableCompanion.insert(
                ayahNumber: ayahNumber,
                audioUrl: audioUrl,
                reciterId: reciterId,
                filePath: filePath,
                isDownloaded: isDownloaded,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AudioCacheTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AudioCacheTableTable,
      AudioCacheTableData,
      $$AudioCacheTableTableFilterComposer,
      $$AudioCacheTableTableOrderingComposer,
      $$AudioCacheTableTableAnnotationComposer,
      $$AudioCacheTableTableCreateCompanionBuilder,
      $$AudioCacheTableTableUpdateCompanionBuilder,
      (
        AudioCacheTableData,
        BaseReferences<
          _$AppDatabase,
          $AudioCacheTableTable,
          AudioCacheTableData
        >,
      ),
      AudioCacheTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SurahsTableTableTableManager get surahsTable =>
      $$SurahsTableTableTableManager(_db, _db.surahsTable);
  $$AyahsTableTableTableManager get ayahsTable =>
      $$AyahsTableTableTableManager(_db, _db.ayahsTable);
  $$FavoritesTableTableTableManager get favoritesTable =>
      $$FavoritesTableTableTableManager(_db, _db.favoritesTable);
  $$NotesTableTableTableManager get notesTable =>
      $$NotesTableTableTableManager(_db, _db.notesTable);
  $$TafsirCacheTableTableTableManager get tafsirCacheTable =>
      $$TafsirCacheTableTableTableManager(_db, _db.tafsirCacheTable);
  $$AudioCacheTableTableTableManager get audioCacheTable =>
      $$AudioCacheTableTableTableManager(_db, _db.audioCacheTable);
}
