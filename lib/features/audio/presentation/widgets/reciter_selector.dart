import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atheer/features/audio/presentation/bloc/reciter/reciter_cubit.dart';
import 'package:atheer/features/audio/presentation/bloc/reciter/reciter_state.dart';

class ReciterSelector extends StatelessWidget {
  final ValueChanged<String>? onReciterChanged;

  const ReciterSelector({super.key, this.onReciterChanged});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReciterCubit, ReciterState>(
      builder: (context, state) {
        if (state is ReciterLoaded) {
          return DropdownButton<String>(
            value: state.selectedReciter?.identifier,
            isExpanded: true,
            items: state.reciters.map((r) {
              return DropdownMenuItem(
                value: r.identifier,
                child: Text(r.name, textDirection: TextDirection.rtl),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                final reciter = state.reciters.firstWhere((r) => r.identifier == value);
                context.read<ReciterCubit>().selectReciter(reciter);
                onReciterChanged?.call(value);
              }
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
