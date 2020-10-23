// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class PodcastRecord extends DataClass implements Insertable<PodcastRecord> {
  final String guidUrl;
  final String title;
  final String author;
  final String description;
  final int subscribers;
  final String logo_url;
  final String website;
  final String mygpo_link;
  final int position_last_week;
  PodcastRecord(
      {@required this.guidUrl,
      @required this.title,
      @required this.author,
      @required this.description,
      @required this.subscribers,
      @required this.logo_url,
      @required this.website,
      this.mygpo_link,
      this.position_last_week});
  factory PodcastRecord.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return PodcastRecord(
      guidUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}guid_url']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      author:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}author']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      subscribers: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}subscribers']),
      logo_url: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}logo_url']),
      website:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}website']),
      mygpo_link: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}mygpo_link']),
      position_last_week: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}position_last_week']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || guidUrl != null) {
      map['guid_url'] = Variable<String>(guidUrl);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || subscribers != null) {
      map['subscribers'] = Variable<int>(subscribers);
    }
    if (!nullToAbsent || logo_url != null) {
      map['logo_url'] = Variable<String>(logo_url);
    }
    if (!nullToAbsent || website != null) {
      map['website'] = Variable<String>(website);
    }
    if (!nullToAbsent || mygpo_link != null) {
      map['mygpo_link'] = Variable<String>(mygpo_link);
    }
    if (!nullToAbsent || position_last_week != null) {
      map['position_last_week'] = Variable<int>(position_last_week);
    }
    return map;
  }

  PodcastRecordsCompanion toCompanion(bool nullToAbsent) {
    return PodcastRecordsCompanion(
      guidUrl: guidUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(guidUrl),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      subscribers: subscribers == null && nullToAbsent
          ? const Value.absent()
          : Value(subscribers),
      logo_url: logo_url == null && nullToAbsent
          ? const Value.absent()
          : Value(logo_url),
      website: website == null && nullToAbsent
          ? const Value.absent()
          : Value(website),
      mygpo_link: mygpo_link == null && nullToAbsent
          ? const Value.absent()
          : Value(mygpo_link),
      position_last_week: position_last_week == null && nullToAbsent
          ? const Value.absent()
          : Value(position_last_week),
    );
  }

  factory PodcastRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PodcastRecord(
      guidUrl: serializer.fromJson<String>(json['guidUrl']),
      title: serializer.fromJson<String>(json['title']),
      author: serializer.fromJson<String>(json['author']),
      description: serializer.fromJson<String>(json['description']),
      subscribers: serializer.fromJson<int>(json['subscribers']),
      logo_url: serializer.fromJson<String>(json['logo_url']),
      website: serializer.fromJson<String>(json['website']),
      mygpo_link: serializer.fromJson<String>(json['mygpo_link']),
      position_last_week: serializer.fromJson<int>(json['position_last_week']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'guidUrl': serializer.toJson<String>(guidUrl),
      'title': serializer.toJson<String>(title),
      'author': serializer.toJson<String>(author),
      'description': serializer.toJson<String>(description),
      'subscribers': serializer.toJson<int>(subscribers),
      'logo_url': serializer.toJson<String>(logo_url),
      'website': serializer.toJson<String>(website),
      'mygpo_link': serializer.toJson<String>(mygpo_link),
      'position_last_week': serializer.toJson<int>(position_last_week),
    };
  }

  PodcastRecord copyWith(
          {String guidUrl,
          String title,
          String author,
          String description,
          int subscribers,
          String logo_url,
          String website,
          String mygpo_link,
          int position_last_week}) =>
      PodcastRecord(
        guidUrl: guidUrl ?? this.guidUrl,
        title: title ?? this.title,
        author: author ?? this.author,
        description: description ?? this.description,
        subscribers: subscribers ?? this.subscribers,
        logo_url: logo_url ?? this.logo_url,
        website: website ?? this.website,
        mygpo_link: mygpo_link ?? this.mygpo_link,
        position_last_week: position_last_week ?? this.position_last_week,
      );
  @override
  String toString() {
    return (StringBuffer('PodcastRecord(')
          ..write('guidUrl: $guidUrl, ')
          ..write('title: $title, ')
          ..write('author: $author, ')
          ..write('description: $description, ')
          ..write('subscribers: $subscribers, ')
          ..write('logo_url: $logo_url, ')
          ..write('website: $website, ')
          ..write('mygpo_link: $mygpo_link, ')
          ..write('position_last_week: $position_last_week')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      guidUrl.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              author.hashCode,
              $mrjc(
                  description.hashCode,
                  $mrjc(
                      subscribers.hashCode,
                      $mrjc(
                          logo_url.hashCode,
                          $mrjc(
                              website.hashCode,
                              $mrjc(mygpo_link.hashCode,
                                  position_last_week.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PodcastRecord &&
          other.guidUrl == this.guidUrl &&
          other.title == this.title &&
          other.author == this.author &&
          other.description == this.description &&
          other.subscribers == this.subscribers &&
          other.logo_url == this.logo_url &&
          other.website == this.website &&
          other.mygpo_link == this.mygpo_link &&
          other.position_last_week == this.position_last_week);
}

class PodcastRecordsCompanion extends UpdateCompanion<PodcastRecord> {
  final Value<String> guidUrl;
  final Value<String> title;
  final Value<String> author;
  final Value<String> description;
  final Value<int> subscribers;
  final Value<String> logo_url;
  final Value<String> website;
  final Value<String> mygpo_link;
  final Value<int> position_last_week;
  const PodcastRecordsCompanion({
    this.guidUrl = const Value.absent(),
    this.title = const Value.absent(),
    this.author = const Value.absent(),
    this.description = const Value.absent(),
    this.subscribers = const Value.absent(),
    this.logo_url = const Value.absent(),
    this.website = const Value.absent(),
    this.mygpo_link = const Value.absent(),
    this.position_last_week = const Value.absent(),
  });
  PodcastRecordsCompanion.insert({
    @required String guidUrl,
    @required String title,
    @required String author,
    @required String description,
    @required int subscribers,
    @required String logo_url,
    @required String website,
    this.mygpo_link = const Value.absent(),
    this.position_last_week = const Value.absent(),
  })  : guidUrl = Value(guidUrl),
        title = Value(title),
        author = Value(author),
        description = Value(description),
        subscribers = Value(subscribers),
        logo_url = Value(logo_url),
        website = Value(website);
  static Insertable<PodcastRecord> custom({
    Expression<String> guidUrl,
    Expression<String> title,
    Expression<String> author,
    Expression<String> description,
    Expression<int> subscribers,
    Expression<String> logo_url,
    Expression<String> website,
    Expression<String> mygpo_link,
    Expression<int> position_last_week,
  }) {
    return RawValuesInsertable({
      if (guidUrl != null) 'guid_url': guidUrl,
      if (title != null) 'title': title,
      if (author != null) 'author': author,
      if (description != null) 'description': description,
      if (subscribers != null) 'subscribers': subscribers,
      if (logo_url != null) 'logo_url': logo_url,
      if (website != null) 'website': website,
      if (mygpo_link != null) 'mygpo_link': mygpo_link,
      if (position_last_week != null) 'position_last_week': position_last_week,
    });
  }

  PodcastRecordsCompanion copyWith(
      {Value<String> guidUrl,
      Value<String> title,
      Value<String> author,
      Value<String> description,
      Value<int> subscribers,
      Value<String> logo_url,
      Value<String> website,
      Value<String> mygpo_link,
      Value<int> position_last_week}) {
    return PodcastRecordsCompanion(
      guidUrl: guidUrl ?? this.guidUrl,
      title: title ?? this.title,
      author: author ?? this.author,
      description: description ?? this.description,
      subscribers: subscribers ?? this.subscribers,
      logo_url: logo_url ?? this.logo_url,
      website: website ?? this.website,
      mygpo_link: mygpo_link ?? this.mygpo_link,
      position_last_week: position_last_week ?? this.position_last_week,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (guidUrl.present) {
      map['guid_url'] = Variable<String>(guidUrl.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (subscribers.present) {
      map['subscribers'] = Variable<int>(subscribers.value);
    }
    if (logo_url.present) {
      map['logo_url'] = Variable<String>(logo_url.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (mygpo_link.present) {
      map['mygpo_link'] = Variable<String>(mygpo_link.value);
    }
    if (position_last_week.present) {
      map['position_last_week'] = Variable<int>(position_last_week.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PodcastRecordsCompanion(')
          ..write('guidUrl: $guidUrl, ')
          ..write('title: $title, ')
          ..write('author: $author, ')
          ..write('description: $description, ')
          ..write('subscribers: $subscribers, ')
          ..write('logo_url: $logo_url, ')
          ..write('website: $website, ')
          ..write('mygpo_link: $mygpo_link, ')
          ..write('position_last_week: $position_last_week')
          ..write(')'))
        .toString();
  }
}

class $PodcastRecordsTable extends PodcastRecords
    with TableInfo<$PodcastRecordsTable, PodcastRecord> {
  final GeneratedDatabase _db;
  final String _alias;
  $PodcastRecordsTable(this._db, [this._alias]);
  final VerificationMeta _guidUrlMeta = const VerificationMeta('guidUrl');
  GeneratedTextColumn _guidUrl;
  @override
  GeneratedTextColumn get guidUrl => _guidUrl ??= _constructGuidUrl();
  GeneratedTextColumn _constructGuidUrl() {
    return GeneratedTextColumn(
      'guid_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _authorMeta = const VerificationMeta('author');
  GeneratedTextColumn _author;
  @override
  GeneratedTextColumn get author => _author ??= _constructAuthor();
  GeneratedTextColumn _constructAuthor() {
    return GeneratedTextColumn(
      'author',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _subscribersMeta =
      const VerificationMeta('subscribers');
  GeneratedIntColumn _subscribers;
  @override
  GeneratedIntColumn get subscribers =>
      _subscribers ??= _constructSubscribers();
  GeneratedIntColumn _constructSubscribers() {
    return GeneratedIntColumn(
      'subscribers',
      $tableName,
      false,
    );
  }

  final VerificationMeta _logo_urlMeta = const VerificationMeta('logo_url');
  GeneratedTextColumn _logo_url;
  @override
  GeneratedTextColumn get logo_url => _logo_url ??= _constructLogoUrl();
  GeneratedTextColumn _constructLogoUrl() {
    return GeneratedTextColumn(
      'logo_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _websiteMeta = const VerificationMeta('website');
  GeneratedTextColumn _website;
  @override
  GeneratedTextColumn get website => _website ??= _constructWebsite();
  GeneratedTextColumn _constructWebsite() {
    return GeneratedTextColumn(
      'website',
      $tableName,
      false,
    );
  }

  final VerificationMeta _mygpo_linkMeta = const VerificationMeta('mygpo_link');
  GeneratedTextColumn _mygpo_link;
  @override
  GeneratedTextColumn get mygpo_link => _mygpo_link ??= _constructMygpoLink();
  GeneratedTextColumn _constructMygpoLink() {
    return GeneratedTextColumn(
      'mygpo_link',
      $tableName,
      true,
    );
  }

  final VerificationMeta _position_last_weekMeta =
      const VerificationMeta('position_last_week');
  GeneratedIntColumn _position_last_week;
  @override
  GeneratedIntColumn get position_last_week =>
      _position_last_week ??= _constructPositionLastWeek();
  GeneratedIntColumn _constructPositionLastWeek() {
    return GeneratedIntColumn(
      'position_last_week',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        guidUrl,
        title,
        author,
        description,
        subscribers,
        logo_url,
        website,
        mygpo_link,
        position_last_week
      ];
  @override
  $PodcastRecordsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'podcast_records';
  @override
  final String actualTableName = 'podcast_records';
  @override
  VerificationContext validateIntegrity(Insertable<PodcastRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('guid_url')) {
      context.handle(_guidUrlMeta,
          guidUrl.isAcceptableOrUnknown(data['guid_url'], _guidUrlMeta));
    } else if (isInserting) {
      context.missing(_guidUrlMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author'], _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('subscribers')) {
      context.handle(
          _subscribersMeta,
          subscribers.isAcceptableOrUnknown(
              data['subscribers'], _subscribersMeta));
    } else if (isInserting) {
      context.missing(_subscribersMeta);
    }
    if (data.containsKey('logo_url')) {
      context.handle(_logo_urlMeta,
          logo_url.isAcceptableOrUnknown(data['logo_url'], _logo_urlMeta));
    } else if (isInserting) {
      context.missing(_logo_urlMeta);
    }
    if (data.containsKey('website')) {
      context.handle(_websiteMeta,
          website.isAcceptableOrUnknown(data['website'], _websiteMeta));
    } else if (isInserting) {
      context.missing(_websiteMeta);
    }
    if (data.containsKey('mygpo_link')) {
      context.handle(
          _mygpo_linkMeta,
          mygpo_link.isAcceptableOrUnknown(
              data['mygpo_link'], _mygpo_linkMeta));
    }
    if (data.containsKey('position_last_week')) {
      context.handle(
          _position_last_weekMeta,
          position_last_week.isAcceptableOrUnknown(
              data['position_last_week'], _position_last_weekMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {guidUrl};
  @override
  PodcastRecord map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PodcastRecord.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PodcastRecordsTable createAlias(String alias) {
    return $PodcastRecordsTable(_db, alias);
  }
}

class EpisodeRecord extends DataClass implements Insertable<EpisodeRecord> {
  final String guidUrl;
  final String title;
  final String podcast_title;
  final String podcast_url;
  final String description;
  final String website;
  final DateTime released;
  final String mygpo_link;
  final String status;
  final int position;
  final int total;
  EpisodeRecord(
      {@required this.guidUrl,
      @required this.title,
      @required this.podcast_title,
      @required this.podcast_url,
      @required this.description,
      @required this.website,
      @required this.released,
      this.mygpo_link,
      @required this.status,
      @required this.position,
      @required this.total});
  factory EpisodeRecord.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    return EpisodeRecord(
      guidUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}guid_url']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      podcast_title: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}podcast_title']),
      podcast_url: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}podcast_url']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      website:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}website']),
      released: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}released']),
      mygpo_link: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}mygpo_link']),
      status:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      position:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}position']),
      total: intType.mapFromDatabaseResponse(data['${effectivePrefix}total']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || guidUrl != null) {
      map['guid_url'] = Variable<String>(guidUrl);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || podcast_title != null) {
      map['podcast_title'] = Variable<String>(podcast_title);
    }
    if (!nullToAbsent || podcast_url != null) {
      map['podcast_url'] = Variable<String>(podcast_url);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || website != null) {
      map['website'] = Variable<String>(website);
    }
    if (!nullToAbsent || released != null) {
      map['released'] = Variable<DateTime>(released);
    }
    if (!nullToAbsent || mygpo_link != null) {
      map['mygpo_link'] = Variable<String>(mygpo_link);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || position != null) {
      map['position'] = Variable<int>(position);
    }
    if (!nullToAbsent || total != null) {
      map['total'] = Variable<int>(total);
    }
    return map;
  }

  EpisodeRecordsCompanion toCompanion(bool nullToAbsent) {
    return EpisodeRecordsCompanion(
      guidUrl: guidUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(guidUrl),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      podcast_title: podcast_title == null && nullToAbsent
          ? const Value.absent()
          : Value(podcast_title),
      podcast_url: podcast_url == null && nullToAbsent
          ? const Value.absent()
          : Value(podcast_url),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      website: website == null && nullToAbsent
          ? const Value.absent()
          : Value(website),
      released: released == null && nullToAbsent
          ? const Value.absent()
          : Value(released),
      mygpo_link: mygpo_link == null && nullToAbsent
          ? const Value.absent()
          : Value(mygpo_link),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      position: position == null && nullToAbsent
          ? const Value.absent()
          : Value(position),
      total:
          total == null && nullToAbsent ? const Value.absent() : Value(total),
    );
  }

  factory EpisodeRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return EpisodeRecord(
      guidUrl: serializer.fromJson<String>(json['guidUrl']),
      title: serializer.fromJson<String>(json['title']),
      podcast_title: serializer.fromJson<String>(json['podcast_title']),
      podcast_url: serializer.fromJson<String>(json['podcast_url']),
      description: serializer.fromJson<String>(json['description']),
      website: serializer.fromJson<String>(json['website']),
      released: serializer.fromJson<DateTime>(json['released']),
      mygpo_link: serializer.fromJson<String>(json['mygpo_link']),
      status: serializer.fromJson<String>(json['status']),
      position: serializer.fromJson<int>(json['position']),
      total: serializer.fromJson<int>(json['total']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'guidUrl': serializer.toJson<String>(guidUrl),
      'title': serializer.toJson<String>(title),
      'podcast_title': serializer.toJson<String>(podcast_title),
      'podcast_url': serializer.toJson<String>(podcast_url),
      'description': serializer.toJson<String>(description),
      'website': serializer.toJson<String>(website),
      'released': serializer.toJson<DateTime>(released),
      'mygpo_link': serializer.toJson<String>(mygpo_link),
      'status': serializer.toJson<String>(status),
      'position': serializer.toJson<int>(position),
      'total': serializer.toJson<int>(total),
    };
  }

  EpisodeRecord copyWith(
          {String guidUrl,
          String title,
          String podcast_title,
          String podcast_url,
          String description,
          String website,
          DateTime released,
          String mygpo_link,
          String status,
          int position,
          int total}) =>
      EpisodeRecord(
        guidUrl: guidUrl ?? this.guidUrl,
        title: title ?? this.title,
        podcast_title: podcast_title ?? this.podcast_title,
        podcast_url: podcast_url ?? this.podcast_url,
        description: description ?? this.description,
        website: website ?? this.website,
        released: released ?? this.released,
        mygpo_link: mygpo_link ?? this.mygpo_link,
        status: status ?? this.status,
        position: position ?? this.position,
        total: total ?? this.total,
      );
  @override
  String toString() {
    return (StringBuffer('EpisodeRecord(')
          ..write('guidUrl: $guidUrl, ')
          ..write('title: $title, ')
          ..write('podcast_title: $podcast_title, ')
          ..write('podcast_url: $podcast_url, ')
          ..write('description: $description, ')
          ..write('website: $website, ')
          ..write('released: $released, ')
          ..write('mygpo_link: $mygpo_link, ')
          ..write('status: $status, ')
          ..write('position: $position, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      guidUrl.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              podcast_title.hashCode,
              $mrjc(
                  podcast_url.hashCode,
                  $mrjc(
                      description.hashCode,
                      $mrjc(
                          website.hashCode,
                          $mrjc(
                              released.hashCode,
                              $mrjc(
                                  mygpo_link.hashCode,
                                  $mrjc(
                                      status.hashCode,
                                      $mrjc(position.hashCode,
                                          total.hashCode)))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is EpisodeRecord &&
          other.guidUrl == this.guidUrl &&
          other.title == this.title &&
          other.podcast_title == this.podcast_title &&
          other.podcast_url == this.podcast_url &&
          other.description == this.description &&
          other.website == this.website &&
          other.released == this.released &&
          other.mygpo_link == this.mygpo_link &&
          other.status == this.status &&
          other.position == this.position &&
          other.total == this.total);
}

class EpisodeRecordsCompanion extends UpdateCompanion<EpisodeRecord> {
  final Value<String> guidUrl;
  final Value<String> title;
  final Value<String> podcast_title;
  final Value<String> podcast_url;
  final Value<String> description;
  final Value<String> website;
  final Value<DateTime> released;
  final Value<String> mygpo_link;
  final Value<String> status;
  final Value<int> position;
  final Value<int> total;
  const EpisodeRecordsCompanion({
    this.guidUrl = const Value.absent(),
    this.title = const Value.absent(),
    this.podcast_title = const Value.absent(),
    this.podcast_url = const Value.absent(),
    this.description = const Value.absent(),
    this.website = const Value.absent(),
    this.released = const Value.absent(),
    this.mygpo_link = const Value.absent(),
    this.status = const Value.absent(),
    this.position = const Value.absent(),
    this.total = const Value.absent(),
  });
  EpisodeRecordsCompanion.insert({
    @required String guidUrl,
    @required String title,
    @required String podcast_title,
    @required String podcast_url,
    @required String description,
    @required String website,
    @required DateTime released,
    this.mygpo_link = const Value.absent(),
    @required String status,
    @required int position,
    @required int total,
  })  : guidUrl = Value(guidUrl),
        title = Value(title),
        podcast_title = Value(podcast_title),
        podcast_url = Value(podcast_url),
        description = Value(description),
        website = Value(website),
        released = Value(released),
        status = Value(status),
        position = Value(position),
        total = Value(total);
  static Insertable<EpisodeRecord> custom({
    Expression<String> guidUrl,
    Expression<String> title,
    Expression<String> podcast_title,
    Expression<String> podcast_url,
    Expression<String> description,
    Expression<String> website,
    Expression<DateTime> released,
    Expression<String> mygpo_link,
    Expression<String> status,
    Expression<int> position,
    Expression<int> total,
  }) {
    return RawValuesInsertable({
      if (guidUrl != null) 'guid_url': guidUrl,
      if (title != null) 'title': title,
      if (podcast_title != null) 'podcast_title': podcast_title,
      if (podcast_url != null) 'podcast_url': podcast_url,
      if (description != null) 'description': description,
      if (website != null) 'website': website,
      if (released != null) 'released': released,
      if (mygpo_link != null) 'mygpo_link': mygpo_link,
      if (status != null) 'status': status,
      if (position != null) 'position': position,
      if (total != null) 'total': total,
    });
  }

  EpisodeRecordsCompanion copyWith(
      {Value<String> guidUrl,
      Value<String> title,
      Value<String> podcast_title,
      Value<String> podcast_url,
      Value<String> description,
      Value<String> website,
      Value<DateTime> released,
      Value<String> mygpo_link,
      Value<String> status,
      Value<int> position,
      Value<int> total}) {
    return EpisodeRecordsCompanion(
      guidUrl: guidUrl ?? this.guidUrl,
      title: title ?? this.title,
      podcast_title: podcast_title ?? this.podcast_title,
      podcast_url: podcast_url ?? this.podcast_url,
      description: description ?? this.description,
      website: website ?? this.website,
      released: released ?? this.released,
      mygpo_link: mygpo_link ?? this.mygpo_link,
      status: status ?? this.status,
      position: position ?? this.position,
      total: total ?? this.total,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (guidUrl.present) {
      map['guid_url'] = Variable<String>(guidUrl.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (podcast_title.present) {
      map['podcast_title'] = Variable<String>(podcast_title.value);
    }
    if (podcast_url.present) {
      map['podcast_url'] = Variable<String>(podcast_url.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (released.present) {
      map['released'] = Variable<DateTime>(released.value);
    }
    if (mygpo_link.present) {
      map['mygpo_link'] = Variable<String>(mygpo_link.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (total.present) {
      map['total'] = Variable<int>(total.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EpisodeRecordsCompanion(')
          ..write('guidUrl: $guidUrl, ')
          ..write('title: $title, ')
          ..write('podcast_title: $podcast_title, ')
          ..write('podcast_url: $podcast_url, ')
          ..write('description: $description, ')
          ..write('website: $website, ')
          ..write('released: $released, ')
          ..write('mygpo_link: $mygpo_link, ')
          ..write('status: $status, ')
          ..write('position: $position, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }
}

class $EpisodeRecordsTable extends EpisodeRecords
    with TableInfo<$EpisodeRecordsTable, EpisodeRecord> {
  final GeneratedDatabase _db;
  final String _alias;
  $EpisodeRecordsTable(this._db, [this._alias]);
  final VerificationMeta _guidUrlMeta = const VerificationMeta('guidUrl');
  GeneratedTextColumn _guidUrl;
  @override
  GeneratedTextColumn get guidUrl => _guidUrl ??= _constructGuidUrl();
  GeneratedTextColumn _constructGuidUrl() {
    return GeneratedTextColumn(
      'guid_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _podcast_titleMeta =
      const VerificationMeta('podcast_title');
  GeneratedTextColumn _podcast_title;
  @override
  GeneratedTextColumn get podcast_title =>
      _podcast_title ??= _constructPodcastTitle();
  GeneratedTextColumn _constructPodcastTitle() {
    return GeneratedTextColumn(
      'podcast_title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _podcast_urlMeta =
      const VerificationMeta('podcast_url');
  GeneratedTextColumn _podcast_url;
  @override
  GeneratedTextColumn get podcast_url =>
      _podcast_url ??= _constructPodcastUrl();
  GeneratedTextColumn _constructPodcastUrl() {
    return GeneratedTextColumn(
      'podcast_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _websiteMeta = const VerificationMeta('website');
  GeneratedTextColumn _website;
  @override
  GeneratedTextColumn get website => _website ??= _constructWebsite();
  GeneratedTextColumn _constructWebsite() {
    return GeneratedTextColumn(
      'website',
      $tableName,
      false,
    );
  }

  final VerificationMeta _releasedMeta = const VerificationMeta('released');
  GeneratedDateTimeColumn _released;
  @override
  GeneratedDateTimeColumn get released => _released ??= _constructReleased();
  GeneratedDateTimeColumn _constructReleased() {
    return GeneratedDateTimeColumn(
      'released',
      $tableName,
      false,
    );
  }

  final VerificationMeta _mygpo_linkMeta = const VerificationMeta('mygpo_link');
  GeneratedTextColumn _mygpo_link;
  @override
  GeneratedTextColumn get mygpo_link => _mygpo_link ??= _constructMygpoLink();
  GeneratedTextColumn _constructMygpoLink() {
    return GeneratedTextColumn(
      'mygpo_link',
      $tableName,
      true,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedTextColumn _status;
  @override
  GeneratedTextColumn get status => _status ??= _constructStatus();
  GeneratedTextColumn _constructStatus() {
    return GeneratedTextColumn(
      'status',
      $tableName,
      false,
    );
  }

  final VerificationMeta _positionMeta = const VerificationMeta('position');
  GeneratedIntColumn _position;
  @override
  GeneratedIntColumn get position => _position ??= _constructPosition();
  GeneratedIntColumn _constructPosition() {
    return GeneratedIntColumn(
      'position',
      $tableName,
      false,
    );
  }

  final VerificationMeta _totalMeta = const VerificationMeta('total');
  GeneratedIntColumn _total;
  @override
  GeneratedIntColumn get total => _total ??= _constructTotal();
  GeneratedIntColumn _constructTotal() {
    return GeneratedIntColumn(
      'total',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        guidUrl,
        title,
        podcast_title,
        podcast_url,
        description,
        website,
        released,
        mygpo_link,
        status,
        position,
        total
      ];
  @override
  $EpisodeRecordsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'episode_records';
  @override
  final String actualTableName = 'episode_records';
  @override
  VerificationContext validateIntegrity(Insertable<EpisodeRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('guid_url')) {
      context.handle(_guidUrlMeta,
          guidUrl.isAcceptableOrUnknown(data['guid_url'], _guidUrlMeta));
    } else if (isInserting) {
      context.missing(_guidUrlMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('podcast_title')) {
      context.handle(
          _podcast_titleMeta,
          podcast_title.isAcceptableOrUnknown(
              data['podcast_title'], _podcast_titleMeta));
    } else if (isInserting) {
      context.missing(_podcast_titleMeta);
    }
    if (data.containsKey('podcast_url')) {
      context.handle(
          _podcast_urlMeta,
          podcast_url.isAcceptableOrUnknown(
              data['podcast_url'], _podcast_urlMeta));
    } else if (isInserting) {
      context.missing(_podcast_urlMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('website')) {
      context.handle(_websiteMeta,
          website.isAcceptableOrUnknown(data['website'], _websiteMeta));
    } else if (isInserting) {
      context.missing(_websiteMeta);
    }
    if (data.containsKey('released')) {
      context.handle(_releasedMeta,
          released.isAcceptableOrUnknown(data['released'], _releasedMeta));
    } else if (isInserting) {
      context.missing(_releasedMeta);
    }
    if (data.containsKey('mygpo_link')) {
      context.handle(
          _mygpo_linkMeta,
          mygpo_link.isAcceptableOrUnknown(
              data['mygpo_link'], _mygpo_linkMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position'], _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total'], _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {guidUrl};
  @override
  EpisodeRecord map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return EpisodeRecord.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $EpisodeRecordsTable createAlias(String alias) {
    return $EpisodeRecordsTable(_db, alias);
  }
}

abstract class _$GpodderDB extends GeneratedDatabase {
  _$GpodderDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $PodcastRecordsTable _podcastRecords;
  $PodcastRecordsTable get podcastRecords =>
      _podcastRecords ??= $PodcastRecordsTable(this);
  $EpisodeRecordsTable _episodeRecords;
  $EpisodeRecordsTable get episodeRecords =>
      _episodeRecords ??= $EpisodeRecordsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [podcastRecords, episodeRecords];
}
