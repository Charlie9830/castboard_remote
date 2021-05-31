import 'package:castboard_core/models/ActorRef.dart';
import 'package:castboard_core/models/CastChangeModel.dart';
import 'package:castboard_core/models/PresetModel.dart';
import 'package:castboard_core/models/TrackRef.dart';
import 'package:castboard_remote/redux/actions/SyncActions.dart';
import 'package:castboard_remote/redux/state/EditingState.dart';
import 'package:castboard_remote/redux/state/NavigationState.dart';

EditingState editingStateReducer(EditingState state, dynamic action) {
  if (action is SetSelectedPresetId) {
    if (action.id == state.selectedPresetId) {
      return state;
    }

    return state.copyWith(
      selectedPresetId: action.id,
      combinedPresetIds: const <String>[],
      editedAssignments: CastChangeModel.initial(),
    );
  }

  if (action is UpdateCombinedPresets) {
    return state.copyWith(
      selectedPresetId: action.basePreset.uid,
      combinedPresetIds:
          action.combinedPresets.map((preset) => preset.uid).toList(),
    );
  }

  if (action is UpdateAssignment) {
    return state.copyWith(
        editedAssignments: state.editedAssignments
            .withUpdatedAssignment(action.trackRef, action.actorRef));
  }

  if (action is ClearLiveEdit) {
    return state.copyWith(
      editedAssignments:
          state.editedAssignments.withRemovedAssignment(action.track),
    );
  }

  return state;
}