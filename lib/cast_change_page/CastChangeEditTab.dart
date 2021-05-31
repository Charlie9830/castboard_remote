import 'package:castboard_core/models/PresetModel.dart';
import 'package:castboard_core/widgets/cast-change-details/CastChangeDetails.dart';
import 'package:castboard_core/widgets/cast-change-details/buildCombinedPresets.dart';
import 'package:castboard_remote/view_models/CastChangePageViewModel.dart';
import 'package:flutter/material.dart';

class CastChangeEditTab extends StatelessWidget {
  final CastChangePageViewModel viewModel;

  const CastChangeEditTab({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: CastChangeDetails(
        selfScrolling: true,
        allowNestedEditing: true,
        actors: viewModel.actors.values.toList(),
        actorsByRef: viewModel.actors,
        tracks: viewModel.tracks.values.toList(),
        tracksByRef: viewModel.tracks,
        assignments: _getAssignments(),
        onAssignmentUpdated: viewModel.onAssignmentUpdated,
        onClearLiveEdit: viewModel.onClearLiveEdit,
      ),
    );
  }

  Map<String, ActorTuple> _getAssignments() {
    return buildCombinedAssignments(
        viewModel.basePreset, viewModel.combinedPresets)
      ..addAll(
        {
          if (viewModel.activeCastChange != null)
            ...viewModel.activeCastChange!.assignments.map(
              (trackRef, actorRef) => MapEntry(
                trackRef.uid,
                ActorTuple(
                  actorRef: actorRef,
                  fromNestedPreset: false,
                  sourcePresetName: '',
                  fromLiveEdit: true,
                ),
              ),
            )
        },
      );
  }
}
