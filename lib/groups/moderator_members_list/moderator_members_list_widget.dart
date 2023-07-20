import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/groups/moderate_view_members_list/moderate_view_members_list_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'moderator_members_list_model.dart';
export 'moderator_members_list_model.dart';

class ModeratorMembersListWidget extends StatefulWidget {
  const ModeratorMembersListWidget({
    Key? key,
    required this.groupRef,
  }) : super(key: key);

  final DocumentReference? groupRef;

  @override
  _ModeratorMembersListWidgetState createState() =>
      _ModeratorMembersListWidgetState();
}

class _ModeratorMembersListWidgetState
    extends State<ModeratorMembersListWidget> {
  late ModeratorMembersListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModeratorMembersListModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<GroupsRecord>(
      stream: GroupsRecord.getDocument(widget.groupRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final moderatorMembersListGroupsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: Color(0xC20D8EED),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Moderate Members',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: DefaultTabController(
                      length: 3,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(0.0, 0),
                            child: TabBar(
                              labelColor: Color(0xFFE6A623),
                              unselectedLabelColor: Color(0xFF9ECAEB),
                              labelStyle:
                                  FlutterFlowTheme.of(context).titleMedium,
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              tabs: [
                                Tab(
                                  text: 'Active',
                                ),
                                Tab(
                                  text: 'Silence',
                                ),
                                Tab(
                                  text: 'Banned',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Builder(
                                  builder: (context) {
                                    final activeGroupMemberList =
                                        moderatorMembersListGroupsRecord
                                            .membersRef
                                            .map((e) => e)
                                            .toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: activeGroupMemberList.length,
                                      itemBuilder: (context,
                                          activeGroupMemberListIndex) {
                                        final activeGroupMemberListItem =
                                            activeGroupMemberList[
                                                activeGroupMemberListIndex];
                                        return Visibility(
                                          visible: !moderatorMembersListGroupsRecord
                                                  .silencedMemberRed
                                                  .contains(
                                                      activeGroupMemberListItem) ||
                                              !moderatorMembersListGroupsRecord
                                                  .bannedMemberRef
                                                  .contains(
                                                      activeGroupMemberListItem),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 5.0),
                                            child: StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  activeGroupMemberListItem),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final containerUsersRecord =
                                                    snapshot.data!;
                                                return Material(
                                                  color: Colors.transparent,
                                                  elevation: 3.0,
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lineColor,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Stack(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        50.0,
                                                                        5.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Slidable(
                                                              endActionPane:
                                                                  ActionPane(
                                                                motion:
                                                                    const ScrollMotion(),
                                                                extentRatio:
                                                                    0.75,
                                                                children: [
                                                                  SlidableAction(
                                                                    label:
                                                                        'Silence',
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xB1EFD100),
                                                                    icon: Icons
                                                                        .volume_off,
                                                                    onPressed:
                                                                        (_) async {
                                                                      await moderatorMembersListGroupsRecord
                                                                          .reference
                                                                          .update({
                                                                        'SilencedMember_red':
                                                                            FieldValue.arrayUnion([
                                                                          containerUsersRecord
                                                                              .reference
                                                                        ]),
                                                                      });
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            '${containerUsersRecord.displayName} is silenced from group!',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                  SlidableAction(
                                                                    label:
                                                                        'Ban',
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xFFF8555B),
                                                                    icon: Icons
                                                                        .person_remove,
                                                                    onPressed:
                                                                        (_) async {
                                                                      await moderatorMembersListGroupsRecord
                                                                          .reference
                                                                          .update({
                                                                        'BannedMember_ref':
                                                                            FieldValue.arrayUnion([
                                                                          containerUsersRecord
                                                                              .reference
                                                                        ]),
                                                                      });
                                                                    },
                                                                  ),
                                                                  SlidableAction(
                                                                    label:
                                                                        'View',
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    icon: Icons
                                                                        .remove_red_eye,
                                                                    onPressed:
                                                                        (_) async {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap: () =>
                                                                                FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: Container(
                                                                                height: 60.0,
                                                                                child: ModerateViewMembersListWidget(
                                                                                  userRef: containerUsersRecord.reference,
                                                                                  groupRef: moderatorMembersListGroupsRecord.reference,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                              child: ListTile(
                                                                title: Text(
                                                                  '${containerUsersRecord.firstname} ${containerUsersRecord.lastname}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge,
                                                                ),
                                                                subtitle: Text(
                                                                  containerUsersRecord
                                                                      .displayName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium,
                                                                ),
                                                                trailing: Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 20.0,
                                                                ),
                                                                tileColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                dense: false,
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          7.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  containerUsersRecord
                                                                      .photoUrl,
                                                                  width: 60.0,
                                                                  height: 60.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Builder(
                                  builder: (context) {
                                    final silenceGroupMemberList =
                                        moderatorMembersListGroupsRecord
                                            .membersRef
                                            .map((e) => e)
                                            .toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: silenceGroupMemberList.length,
                                      itemBuilder: (context,
                                          silenceGroupMemberListIndex) {
                                        final silenceGroupMemberListItem =
                                            silenceGroupMemberList[
                                                silenceGroupMemberListIndex];
                                        return Visibility(
                                          visible: moderatorMembersListGroupsRecord
                                                  .silencedMemberRed
                                                  .contains(
                                                      silenceGroupMemberListItem) &&
                                              !moderatorMembersListGroupsRecord
                                                  .bannedMemberRef
                                                  .contains(
                                                      silenceGroupMemberListItem),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 5.0),
                                            child: StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  silenceGroupMemberListItem),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final containerUsersRecord =
                                                    snapshot.data!;
                                                return Material(
                                                  color: Colors.transparent,
                                                  elevation: 3.0,
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lineColor,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Stack(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        50.0,
                                                                        5.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Slidable(
                                                              endActionPane:
                                                                  ActionPane(
                                                                motion:
                                                                    const ScrollMotion(),
                                                                extentRatio:
                                                                    0.5,
                                                                children: [
                                                                  SlidableAction(
                                                                    label:
                                                                        'Unsilence',
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xB1EFD100),
                                                                    icon: Icons
                                                                        .volume_mute,
                                                                    onPressed:
                                                                        (_) async {
                                                                      await moderatorMembersListGroupsRecord
                                                                          .reference
                                                                          .update({
                                                                        'SilencedMember_red':
                                                                            FieldValue.arrayRemove([
                                                                          containerUsersRecord
                                                                              .reference
                                                                        ]),
                                                                      });
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            '${containerUsersRecord.displayName} is now unsilenced!',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                  SlidableAction(
                                                                    label:
                                                                        'View',
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    icon: Icons
                                                                        .remove_red_eye,
                                                                    onPressed:
                                                                        (_) {
                                                                      print(
                                                                          'SlidableActionWidget pressed ...');
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                              child: ListTile(
                                                                title: Text(
                                                                  '${containerUsersRecord.firstname} ${containerUsersRecord.lastname}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge,
                                                                ),
                                                                subtitle: Text(
                                                                  containerUsersRecord
                                                                      .displayName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium,
                                                                ),
                                                                trailing: Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 20.0,
                                                                ),
                                                                tileColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                dense: false,
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          7.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  containerUsersRecord
                                                                      .photoUrl,
                                                                  width: 60.0,
                                                                  height: 60.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Builder(
                                  builder: (context) {
                                    final banGroupMemberList =
                                        moderatorMembersListGroupsRecord
                                            .membersRef
                                            .map((e) => e)
                                            .toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: banGroupMemberList.length,
                                      itemBuilder:
                                          (context, banGroupMemberListIndex) {
                                        final banGroupMemberListItem =
                                            banGroupMemberList[
                                                banGroupMemberListIndex];
                                        return Visibility(
                                          visible: !moderatorMembersListGroupsRecord
                                                  .silencedMemberRed
                                                  .contains(
                                                      banGroupMemberListItem) &&
                                              moderatorMembersListGroupsRecord
                                                  .bannedMemberRef
                                                  .contains(
                                                      banGroupMemberListItem),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 5.0),
                                            child: StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  banGroupMemberListItem),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final containerUsersRecord =
                                                    snapshot.data!;
                                                return Material(
                                                  color: Colors.transparent,
                                                  elevation: 3.0,
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lineColor,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Stack(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        50.0,
                                                                        5.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Slidable(
                                                              endActionPane:
                                                                  ActionPane(
                                                                motion:
                                                                    const ScrollMotion(),
                                                                extentRatio:
                                                                    0.5,
                                                                children: [
                                                                  SlidableAction(
                                                                    label:
                                                                        'UnBan',
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xFFF8555B),
                                                                    icon: Icons
                                                                        .person_add,
                                                                    onPressed:
                                                                        (_) async {
                                                                      await moderatorMembersListGroupsRecord
                                                                          .reference
                                                                          .update({
                                                                        'BannedMember_ref':
                                                                            FieldValue.arrayRemove([
                                                                          containerUsersRecord
                                                                              .reference
                                                                        ]),
                                                                      });
                                                                    },
                                                                  ),
                                                                  SlidableAction(
                                                                    label:
                                                                        'View',
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    icon: Icons
                                                                        .remove_red_eye,
                                                                    onPressed:
                                                                        (_) {
                                                                      print(
                                                                          'SlidableActionWidget pressed ...');
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                              child: ListTile(
                                                                title: Text(
                                                                  '${containerUsersRecord.firstname} ${containerUsersRecord.lastname}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge,
                                                                ),
                                                                subtitle: Text(
                                                                  containerUsersRecord
                                                                      .displayName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium,
                                                                ),
                                                                trailing: Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 20.0,
                                                                ),
                                                                tileColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                dense: false,
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          7.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  containerUsersRecord
                                                                      .photoUrl,
                                                                  width: 60.0,
                                                                  height: 60.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
