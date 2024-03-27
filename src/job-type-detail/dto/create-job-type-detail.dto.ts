import { ApiProperty } from "@nestjs/swagger"
import { jobTypeDetailList } from "@prisma/client"

export class CreateJobTypeDetailDto {
    @ApiProperty()
    job_type_detail_name: string

    @ApiProperty()
    image: string

    @ApiProperty()
    job_type_id: number
}

export class CreateJobTypeDetailListDto {
    @ApiProperty()
    id: number

    @ApiProperty()
    job_type_detail_id: number

    @ApiProperty()
    detail_name: string   

    @ApiProperty()
    job_type_detail_list: number[]
}