import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'moderate_view_members_list_model.dart';
export 'moderate_view_members_list_model.dart';

class ModerateViewMembersListWidget extends StatefulWidget {
  const ModerateViewMembersListWidget({
    Key? key,
    required this.userRef,
    required this.groupRef,
  }) : super(key: key);

  final DocumentReference? userRef;
  final DocumentReference? groupRef;

  @override
  _ModerateViewMembersListWidgetState createState() =>
      _ModerateViewMembersListWidgetState();
}

class _ModerateViewMembersListWidgetState
    extends State<ModerateViewMembersListWidget> {
  late ModerateViewMembersListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModerateViewMembersListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(widget.userRef!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          final columnUsersRecord = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://picsum.photos/seed/9/600',
                        width: double.infinity,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 150.0, 0.0, 0.0),
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'https://picsum.photos/seed/621/600',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                      child: StreamBuilder<GroupsRecord>(
                        stream: GroupsRecord.getDocument(widget.groupRef!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          final rowGroupsRecord = snapshot.data!;
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (!rowGroupsRecord.moderatorsRef
                                  .contains(columnUsersRecord.reference))
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await widget.groupRef!.update({
                                        'Moderators_ref': FieldValue.arrayUnion(
                                            [columnUsersRecord.reference]),
                                      });
                                    },
                                    text: 'Make Mod',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFFE6A623),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              if (rowGroupsRecord.moderatorsRef
                                  .contains(columnUsersRecord.reference))
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await widget.groupRef!.update({
                                        'Moderators_ref':
                                            FieldValue.arrayRemove(
                                                [columnUsersRecord.reference]),
                                      });
                                    },
                                    text: 'Remove Mod',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context).error,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Text(
                    columnUsersRecord.displayName,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                  child: StreamBuilder<GroupsRecord>(
                    stream: GroupsRecord.getDocument(widget.groupRef!),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      final rowGroupsRecord = snapshot.data!;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (rowGroupsRecord.silencedMemberRed
                              .contains(columnUsersRecord.reference))
                            Text(
                              'User is Silence',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFFF8555B),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 200.0,
                  child: Divider(
                    thickness: 2.0,
                    color: Color(0xFB00FFDE),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                  child: StreamBuilder<List<PostsRecord>>(
                    stream: queryPostsRecord(
                      queryBuilder: (postsRecord) => postsRecord
                          .where('Group_ref', isEqualTo: widget.groupRef)
                          .where('PostedBy_ref',
                              isEqualTo: columnUsersRecord.reference),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<PostsRecord> listViewPostsRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewPostsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewPostsRecord =
                              listViewPostsRecordList[listViewIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 24.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onLongPress: () async {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Delete Post'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('Confirm'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  await listViewPostsRecord.reference.delete();
                                  return;
                                } else {
                                  return;
                                }
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 10.0,
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0.0,
                                        color: Color(0xFFF1F4F8),
                                        offset: Offset(0.0, 1.0),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 4.0, 4.0, 4.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 4.0),
                                          child: StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                listViewPostsRecord
                                                    .postedByRef!),
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
                                              final rowUsersRecord =
                                                  snapshot.data!;
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'PublicProfile',
                                                    queryParameters: {
                                                      'userRef': serializeParam(
                                                        rowUsersRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        rowUsersRecord.photoUrl,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  4.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                rowUsersRecord
                                                                    .firstname,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Plus Jakarta Sans',
                                                                      color: Color(
                                                                          0xFF14181B),
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  rowUsersRecord
                                                                      .lastname,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Plus Jakarta Sans',
                                                                        color: Color(
                                                                            0xFF14181B),
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          RichText(
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: rowUsersRecord
                                                                      .displayName,
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                TextSpan(
                                                                  text: ' • ',
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                TextSpan(
                                                                  text: dateTimeFormat(
                                                                      'relative',
                                                                      listViewPostsRecord
                                                                          .dateCreated!),
                                                                  style:
                                                                      TextStyle(),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    color: Color(
                                                                        0xFF57636C),
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 4.0, 12.0),
                                                child: Text(
                                                  listViewPostsRecord.content,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                              if (listViewPostsRecord.photo !=
                                                      null &&
                                                  listViewPostsRecord.photo !=
                                                      '')
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType
                                                            .fade,
                                                        child:
                                                            FlutterFlowExpandedImageView(
                                                          image: Image.network(
                                                            listViewPostsRecord
                                                                .photo,
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag:
                                                              listViewPostsRecord
                                                                  .photo,
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: listViewPostsRecord
                                                        .photo,
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      child: Image.network(
                                                        listViewPostsRecord
                                                            .photo,
                                                        width: double.infinity,
                                                        height: 250.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (listViewPostsRecord.video !=
                                                      null &&
                                                  listViewPostsRecord.video !=
                                                      '')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: FlutterFlowVideoPlayer(
                                                    path: listViewPostsRecord
                                                        .video,
                                                    videoType:
                                                        VideoType.network,
                                                    autoPlay: false,
                                                    looping: false,
                                                    showControls: true,
                                                    allowFullScreen: true,
                                                    allowPlaybackSpeedMenu:
                                                        false,
                                                    lazyLoad: true,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
