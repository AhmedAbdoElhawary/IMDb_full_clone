# Diff Details

Date : 2022-12-08 14:25:02

Directory d:\\IMDB_full_clone\\New folder\\xxxx\\IMDb_full_clone

Total : 82 files,  6912 codes, 144 comments, 716 blanks, all 7772 lines

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [lib/helper/functions/api_result.dart](/lib/helper/functions/api_result.dart) | Dart | 9 | 0 | 4 | 13 |
| [lib/helper/functions/api_result.freezed.dart](/lib/helper/functions/api_result.freezed.dart) | Dart | 290 | 18 | 47 | 355 |
| [lib/helper/functions/error_model.dart](/lib/helper/functions/error_model.dart) | Dart | 10 | 0 | 8 | 18 |
| [lib/helper/functions/error_model.g.dart](/lib/helper/functions/error_model.g.dart) | Dart | 10 | 4 | 5 | 19 |
| [lib/helper/functions/network_exceptions.dart](/lib/helper/functions/network_exceptions.dart) | Dart | 139 | 0 | 24 | 163 |
| [lib/helper/functions/network_exceptions.freezed.dart](/lib/helper/functions/network_exceptions.freezed.dart) | Dart | 3,519 | 66 | 277 | 3,862 |
| [lib/helper/my_app.dart](/lib/helper/my_app.dart) | Dart | -51 | 0 | -7 | -58 |
| [lib/helper/resources/color_manager.dart](/lib/helper/resources/color_manager.dart) | Dart | 2 | 0 | 1 | 3 |
| [lib/helper/use_case/use_case.dart](/lib/helper/use_case/use_case.dart) | Dart | -23 | 0 | -6 | -29 |
| [lib/helper/utility/constant.dart](/lib/helper/utility/constant.dart) | Dart | 1 | 0 | 1 | 2 |
| [lib/helper/utility/injector.dart](/lib/helper/utility/injector.dart) | Dart | 57 | -8 | 10 | 59 |
| [lib/helper/utility/private_keys.dart](/lib/helper/utility/private_key.dart) | Dart | 1 | 0 | 1 | 2 |
| [lib/helper/widgets/multi_bloc_provider.dart](/lib/helper/widgets/multi_bloc_provider.dart) | Dart | -9 | -10 | -4 | -23 |
| [lib/main.dart](/lib/main.dart) | Dart | 3 | 0 | 1 | 4 |
| [lib/models/box_office.dart](/lib/models/box_office.dart) | Dart | 17 | 0 | 6 | 23 |
| [lib/models/box_office.g.dart](/lib/models/box_office.g.dart) | Dart | 74 | 5 | 10 | 89 |
| [lib/models/info_with_id_api.dart](/lib/models/info_with_id_api.dart) | Dart | 21 | 0 | 6 | 27 |
| [lib/models/info_with_id_api.g.dart](/lib/models/info_with_id_api.g.dart) | Dart | 107 | 5 | 11 | 123 |
| [lib/models/most_popular_films_api.dart](/lib/models/most_popular_films_api.dart) | Dart | 15 | 0 | 6 | 21 |
| [lib/models/most_popular_films_api.g.dart](/lib/models/most_popular_films_api.g.dart) | Dart | 67 | 5 | 10 | 82 |
| [lib/models/new_films_api.dart](/lib/models/new_films_api.dart) | Dart | 14 | 0 | 6 | 20 |
| [lib/models/new_films_api.g.dart](/lib/models/new_films_api.g.dart) | Dart | 71 | 5 | 10 | 86 |
| [lib/models/top_250_films_api.dart](/lib/models/top_250_films_api.dart) | Dart | 16 | 0 | 8 | 24 |
| [lib/models/top_250_films_api.g.dart](/lib/models/top_250_films_api.g.dart) | Dart | 67 | 5 | 10 | 82 |
| [lib/presentation/layouts/base_layout.dart](/lib/presentation/layouts/base_layout.dart) | Dart | -54 | 0 | -7 | -61 |
| [lib/presentation/pages/film_details/film_details_page.dart](/lib/presentation/pages/film_details/film_details_page.dart) | Dart | -1,107 | -2 | -77 | -1,186 |
| [lib/presentation/pages/films_filtered/films_filtered_page.dart](/lib/presentation/pages/films_filtered/films_filtered_page.dart) | Dart | -83 | 0 | -5 | -88 |
| [lib/presentation/pages/home/home_page.dart](/lib/presentation/pages/home/home_page.dart) | Dart | -226 | 0 | -16 | -242 |
| [lib/presentation/pages/home/widgets/actor_birth_day_card.dart](/lib/presentation/pages/home/widgets/actor_birth_day_card.dart) | Dart | -68 | 0 | -5 | -73 |
| [lib/presentation/pages/home/widgets/add_to_wach_list.dart](/lib/presentation/pages/home/widgets/add_to_wach_list.dart) | Dart | -28 | 0 | -4 | -32 |
| [lib/presentation/pages/home/widgets/film_card.dart](/lib/presentation/pages/home/widgets/film_card.dart) | Dart | -112 | 0 | -10 | -122 |
| [lib/presentation/pages/search/search_page.dart](/lib/presentation/pages/search/search_page.dart) | Dart | -75 | 0 | -4 | -79 |
| [lib/presentation/pages/video/video_page.dart](/lib/presentation/pages/video/video_page.dart) | Dart | -282 | 0 | -20 | -302 |
| [lib/repositories/box_office_repo.dart](/lib/repositories/box_office_repo.dart) | Dart | 27 | 0 | 4 | 31 |
| [lib/repositories/info_with_id_repo.dart](/lib/repositories/info_with_id_repo.dart) | Dart | 37 | 0 | 5 | 42 |
| [lib/repositories/most_popular_films_repo.dart](/lib/repositories/most_popular_films_repo.dart) | Dart | 26 | 0 | 4 | 30 |
| [lib/repositories/new_films_repo.dart](/lib/repositories/new_films_repo.dart) | Dart | 24 | 0 | 4 | 28 |
| [lib/repositories/top_250_films_repo.dart](/lib/repositories/top_250_films_repo.dart) | Dart | 25 | 0 | 4 | 29 |
| [lib/view_models/award_info/award_info_details.dart](/lib/view_models/award_info/award_info_details.dart) | Dart | 110 | 0 | 16 | 126 |
| [lib/view_models/box_office/box_office_details.dart](/lib/view_models/box_office/box_office_details.dart) | Dart | 23 | 0 | 5 | 28 |
| [lib/view_models/box_office/box_office_items.dart](/lib/view_models/box_office/box_office_items.dart) | Dart | 37 | 0 | 5 | 42 |
| [lib/view_models/box_office_of_all_time/box_office_of_all_time_details.dart](/lib/view_models/box_office_of_all_time/box_office_of_all_time_details.dart) | Dart | 23 | 0 | 5 | 28 |
| [lib/view_models/box_office_of_all_time/box_office_of_all_time_items.dart](/lib/view_models/box_office_of_all_time/box_office_of_all_time_items.dart) | Dart | 45 | 0 | 5 | 50 |
| [lib/view_models/film/film_details.dart](/lib/view_models/film/film_details.dart) | Dart | 23 | 0 | 6 | 29 |
| [lib/view_models/film/film_items.dart](/lib/view_models/film/film_items.dart) | Dart | 51 | 0 | 4 | 55 |
| [lib/view_models/in_theaters/new_film_details.dart](/lib/view_models/in_theaters/new_film_details.dart) | Dart | 23 | 0 | 5 | 28 |
| [lib/view_models/in_theaters/new_fim_items.dart](/lib/view_models/in_theaters/new_fim_items.dart) | Dart | 136 | 0 | 13 | 149 |
| [lib/view_models/personal_info/personal_info_details.dart](/lib/view_models/personal_info/personal_info_details.dart) | Dart | 123 | 0 | 12 | 135 |
| [lib/view_models/youtube_trailer/youtube_trailer_details.dart](/lib/view_models/youtube_trailer/youtube_trailer_details.dart) | Dart | 41 | 0 | 4 | 45 |
| [lib/views/base_layouts/base_layout.dart](/lib/views/base_layouts/base_layout.dart) | Dart | 68 | 0 | 7 | 75 |
| [lib/views/bloc/box_office/box_office_cubit.dart](/lib/views/bloc/box_office/box_office_cubit.dart) | Dart | 5 | 0 | 2 | 7 |
| [lib/views/bloc/cubit_result_state.dart](/lib/views/bloc/cubit_result_state.dart) | Dart | 10 | 0 | 6 | 16 |
| [lib/views/bloc/cubit_result_state.freezed.dart](/lib/views/bloc/cubit_result_state.freezed.dart) | Dart | 517 | 24 | 75 | 616 |
| [lib/views/bloc/info_with_id/info_with_id_cubit.dart](/lib/views/bloc/info_with_id/info_with_id_cubit.dart) | Dart | 6 | 0 | 2 | 8 |
| [lib/views/bloc/most_popular_films/most_popular_films_cubit.dart](/lib/views/bloc/most_popular_films/most_popular_films_cubit.dart) | Dart | 30 | 0 | 6 | 36 |
| [lib/views/bloc/new_films/new_films.dart](/lib/views/bloc/new_films/new_films.dart) | Dart | 5 | 0 | 5 | 10 |
| [lib/views/bloc/top_250_films/top250_films_cubit.dart](/lib/views/bloc/top_250_films/top250_films_cubit.dart) | Dart | 34 | 0 | 5 | 39 |
| [lib/views/common_widgets/basic_film_and_sub_info_in_row.dart](/lib/views/common_widgets/basic_film_and_sub_info_in_row.dart) | Dart | -7 | 20 | -1 | 12 |
| [lib/views/common_widgets/custom_circulars_progress.dart](/lib/views/common_widgets/custom_circulars_progress.dart) | Dart | -4 | 0 | 0 | -4 |
| [lib/views/common_widgets/films_main_floating_container.dart](/lib/views/common_widgets/films_main_floating_container.dart) | Dart | 1 | 0 | -2 | -1 |
| [lib/views/common_widgets/floating_container.dart](/lib/views/common_widgets/floating_container.dart) | Dart | 6 | 0 | 0 | 6 |
| [lib/views/common_widgets/text_field/custom_text_field.dart](/lib/views/common_widgets/text_field/custom_text_field.dart) | Dart | -47 | 0 | -3 | -50 |
| [lib/views/common_widgets/text_field/mobile_phone_text_field.dart](/lib/views/common_widgets/text_field/mobile_phone_text_field.dart) | Dart | -2 | 0 | 0 | -2 |
| [lib/views/multi_bloc_provider.dart](/lib/views/multi_bloc_provider.dart) | Dart | 32 | 0 | 4 | 36 |
| [lib/views/my_app.dart](/lib/views/my_app.dart) | Dart | 52 | 0 | 5 | 57 |
| [lib/views/pages/film_details/film_details_page.dart](/lib/views/pages/film_details/film_details_page.dart) | Dart | 1,107 | 2 | 76 | 1,185 |
| [lib/views/pages/films_filtered/films_filtered_page.dart](/lib/views/pages/films_filtered/films_filtered_page.dart) | Dart | 78 | 0 | 5 | 83 |
| [lib/views/pages/home/home_page.dart](/lib/views/pages/home/home_page.dart) | Dart | 227 | 0 | 14 | 241 |
| [lib/views/pages/home/widgets/actor_birth_day_card.dart](/lib/views/pages/home/widgets/actor_birth_day_card.dart) | Dart | 68 | 0 | 5 | 73 |
| [lib/views/pages/home/widgets/add_to_wach_list.dart](/lib/views/pages/home/widgets/add_to_wach_list.dart) | Dart | 28 | 0 | 4 | 32 |
| [lib/views/pages/home/widgets/film_card.dart](/lib/views/pages/home/widgets/film_card.dart) | Dart | 112 | 0 | 10 | 122 |
| [lib/views/pages/personal/appearance_page.dart](/lib/views/pages/personal/appearance_page.dart) | Dart | 164 | 0 | 9 | 173 |
| [lib/views/pages/personal/personal_page.dart](/lib/views/pages/personal/personal_page.dart) | Dart | 81 | 0 | 6 | 87 |
| [lib/views/pages/personal/settings_page.dart](/lib/views/pages/personal/settings_page.dart) | Dart | 85 | 0 | 5 | 90 |
| [lib/views/pages/search/main_pages/search_page.dart](/lib/views/pages/search/main_pages/search_page.dart) | Dart | 245 | 0 | 13 | 258 |
| [lib/views/pages/search/main_pages/search_result_page.dart](/lib/views/pages/search/main_pages/search_result_page.dart) | Dart | 350 | 5 | 27 | 382 |
| [lib/views/pages/search/sub_pages/top_250_movies_page.dart](/lib/views/pages/search/sub_pages/top_250_movies_page.dart) | Dart | 37 | 0 | 3 | 40 |
| [lib/views/pages/search/widgets/search_text_field.dart](/lib/views/pages/search/widgets/search_text_field.dart) | Dart | 36 | 0 | 3 | 39 |
| [lib/views/pages/video/video_page.dart](/lib/views/pages/video/video_page.dart) | Dart | 132 | 0 | 6 | 138 |
| [lib/views/pages/video/video_watch_page.dart](/lib/views/pages/video/video_watch_page.dart) | Dart | 282 | 0 | 20 | 302 |
| [pubspec.yaml](/pubspec.yaml) | YAML | 8 | 0 | 2 | 10 |
| [test/widget_test.dart](/test/widget_test.dart) | Dart | 0 | 0 | -1 | -1 |

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details