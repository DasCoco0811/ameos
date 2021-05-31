<template>
    <breeze-authenticated-layout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Dashboard
            </h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 bg-white border-b border-gray-200">
                        You're logged in!
                    </div>
                </div>
            </div>
        </div>

        <ProgressWidget></ProgressWidget>
        <FeatureBadgesWidget></FeatureBadgesWidget>
        <MembersWidget></MembersWidget>
        <TeaserWidget></TeaserWidget>

    </breeze-authenticated-layout>
</template>

<script>
    import CreatorWidget from '@/Components/CreatorWidget'
    import ProgressWidget from '@/Components/ProgressWidget'
    import GroupsWidget from '@/Components/GroupsWidget'
    import FriendsActivityWidget from '@/Components/FriendsActivityWidget'
    import CalendarWidget from '@/Components/CalendarWidget'
    import ReactionsReceived from '@/Components/ReactionsReceivedWidget'
    import StatsBoxWidget from '@/Components/StatsBoxWidget'
    import OpenQuestsWidget from '@/Components/OpenQuestsWidget'
    import TeaserWidget from '@/Components/TeaserWidget'
    import MembersWidget from '@/Components/MembersWidget'
    import ProgressWidget from '@/Components/ProgressWidget'
    import FeatureBadgesWidget from '@/Components/FeatureBadgesWidget'
    import BreezeAuthenticatedLayout from '@/Layouts/Authenticated'

    export default {
        components: {
            ProgressWidget,
            FeatureBadgesWidget,
            BreezeAuthenticatedLayout,
            MembersWidget,
            TeaserWidget,
            OpenQuestsWidget,
            StatsBoxWidget,
            ReactionsReceived,
            CalendarWidget,
            FriendsActivityWidget,
            GroupsWidget,
            PostWidget,
            CreatorWidget,
        },

        props: {
            auth: Object,
            errors: Object,
        },
    }
</script>
