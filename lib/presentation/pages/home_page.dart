import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/app_helper.dart';
import 'package:weather/presentation/app_assets.dart';
import 'package:weather/presentation/styles/style.dart';
import 'package:weather/provider/home_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(homeProvider.notifier).getWeatherInfo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeProvider);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesImage), fit: BoxFit.cover),
        ),
        child: state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  SizedBox(height: 24 + MediaQuery.paddingOf(context).top),
                  Container(
                    height: 380,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 36),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: (state.weathers?.current?.tempC ?? 0) < 0
                          ? Style.snowy
                          : (state.weathers?.current?.tempC ?? 0) < 15
                              ? Style.rainy
                              : (state.weathers?.current?.tempC ?? 0) < 25
                                  ? Style.cloudy
                                  : Style.sunny,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      children: [
                        Text(
                          DateFormat("dd MMM yyyy").format(
                              state.weathers?.location?.localtime ??
                                  DateTime.now()),
                          style: TextStyle(
                            fontSize: 21,
                            color: AppHelper.getTextColor(
                                state.weathers?.current?.tempC),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(AppHelper.getSvg(
                                state.weathers?.current?.tempC)),
                            const SizedBox(width: 12),
                            Text(
                              '${state.weathers?.current?.tempC.toString().split('.')[0] ?? ""}°',
                              style: TextStyle(
                                fontSize: 86,
                                color: AppHelper.getTextColor(
                                    state.weathers?.current?.tempC),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          state.weathers?.current?.condition?.text ?? '',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppHelper.getTextColor(
                                state.weathers?.current?.tempC),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${state.weathers?.location?.region ?? ''}, ${state.weathers?.location?.country ?? ''}',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppHelper.getTextColor(
                                state.weathers?.current?.tempC),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Wind speed',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppHelper.getTextColor(
                                        state.weathers?.current?.tempC)),
                              ),
                            ),
                            Text(
                              '${state.weathers?.current?.windKph.toString()}km/h',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppHelper.getTextColor(
                                      state.weathers?.current?.tempC)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Humidity',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppHelper.getTextColor(
                                        state.weathers?.current?.tempC)),
                              ),
                            ),
                            Text(
                              '${state.weathers?.current?.humidity.toString()}%',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppHelper.getTextColor(
                                      state.weathers?.current?.tempC)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Cloud',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppHelper.getTextColor(
                                        state.weathers?.current?.tempC)),
                              ),
                            ),
                            Text(
                              '${state.weathers?.current?.cloud.toString()}%',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppHelper.getTextColor(
                                      state.weathers?.current?.tempC)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
